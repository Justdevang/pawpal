import UIKit
import Flutter
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Configure Firebase if plist is present
    if Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") != nil {
      FirebaseApp.configure()
      Messaging.messaging().delegate = self
    }

    // Register for remote notifications
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
        if let error = error {
          print("Notification permission error: \(error)")
        }
      }
    } else {
      let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }

    application.registerForRemoteNotifications()

    // Set up notification categories with actions
    setupNotificationCategories()

    // Generated plugin registrant
    GeneratedPluginRegistrant.register(with: self)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // MARK: - Notification Categories

  private func setupNotificationCategories() {
    let givenAction = UNNotificationAction(
      identifier: "GIVEN",
      title: "Given",
      options: [.foreground]
    )

    let snoozeAction = UNNotificationAction(
      identifier: "SNOOZE",
      title: "Snooze 15m",
      options: [.foreground]
    )

    let skipAction = UNNotificationAction(
      identifier: "SKIP",
      title: "Skip",
      options: [.foreground]
    )

    let reminderCategory = UNNotificationCategory(
      identifier: "reminder_category",
      actions: [givenAction, snoozeAction, skipAction],
      intentIdentifiers: [],
      options: [.customDismissAction]
    )

    UNUserNotificationCenter.current().setNotificationCategories([reminderCategory])
  }

  // MARK: - Remote Notifications

  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    Messaging.messaging().apnsToken = deviceToken
    let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
    let token = tokenParts.joined()
    print("APNs Token: \(token)")
  }

  override func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    print("Failed to register for remote notifications: \(error)")
  }

  // MARK: - UNUserNotificationCenterDelegate

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    // Show notification even when app is in foreground
    completionHandler([.banner, .badge, .sound])
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    let actionIdentifier = response.actionIdentifier
    let userInfo = response.notification.request.content.userInfo

    print("Notification action: \(actionIdentifier)")
    print("User info: \(userInfo)")

    // Handle custom actions
    switch actionIdentifier {
    case "GIVEN":
      handleNotificationAction("given", userInfo: userInfo)
    case "SNOOZE":
      handleNotificationAction("snooze", userInfo: userInfo)
    case "SKIP":
      handleNotificationAction("skip", userInfo: userInfo)
    case UNNotificationDefaultActionIdentifier:
      // User tapped the notification
      handleNotificationTap(userInfo: userInfo)
    case UNNotificationDismissActionIdentifier:
      // User dismissed the notification
      break
    default:
      break
    }

    completionHandler()
  }

  // MARK: - MessagingDelegate

  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("FCM registration token: \(fcmToken ?? "nil")")
    // Send token to server if needed
  }

  // MARK: - Helper Methods

  private func handleNotificationAction(_ action: String, userInfo: [AnyHashable: Any]) {
    print("Handling notification action: \(action)")

    // Send to Flutter via method channel
    guard let controller = window?.rootViewController as? FlutterViewController else { return }
    let channel = FlutterMethodChannel(name: "com.pawpal.app/notifications", binaryMessenger: controller.binaryMessenger)

    channel.invokeMethod("onNotificationAction", arguments: [
      "action": action,
      "reminderId": userInfo["reminderId"] as? Int ?? -1,
      "payload": userInfo["payload"] as? String ?? ""
    ])
  }

  private func handleNotificationTap(userInfo: [AnyHashable: Any]) {
    print("Notification tapped: \(userInfo)")

    // Navigate in Flutter
    guard let controller = window?.rootViewController as? FlutterViewController else { return }
    let channel = FlutterMethodChannel(name: "com.pawpal.app/notifications", binaryMessenger: controller.binaryMessenger)

    channel.invokeMethod("onNotificationTap", arguments: userInfo)
  }
}