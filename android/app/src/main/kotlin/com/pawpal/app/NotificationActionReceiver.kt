package com.pawpal.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.core.content.ContextCompat
import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin

/**
 * Broadcast receiver for notification actions (Given, Snooze, Skip)
 * Receives actions from flutter_local_notifications and communicates with Flutter
 */
class NotificationActionReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action
        val reminderId = intent.getIntExtra("reminderId", -1)
        val payload = intent.getStringExtra("payload")

        Log.d("PawPal", "Notification action received: $action, reminderId: $reminderId")

        when (action) {
            "com.pawpal.app.GIVEN" -> handleGiven(context, reminderId, payload)
            "com.pawpal.app.SNOOZE" -> handleSnooze(context, reminderId, payload)
            "com.pawpal.app.SKIP" -> handleSkip(context, reminderId, payload)
            else -> Log.w("PawPal", "Unknown notification action: $action")
        }
    }

    private fun handleGiven(context: Context, reminderId: Int, payload: String?) {
        Log.d("PawPal", "Given action for reminder: $reminderId")
        // Send to Flutter via method channel
        sendToFlutter("notificationAction", mapOf(
            "action" to "given",
            "reminderId" to reminderId,
            "payload" to payload
        ))
    }

    private fun handleSnooze(context: Context, reminderId: Int, payload: String?) {
        Log.d("PawPal", "Snooze action for reminder: $reminderId")
        sendToFlutter("notificationAction", mapOf(
            "action" to "snooze",
            "reminderId" to reminderId,
            "payload" to payload
        ))
    }

    private fun handleSkip(context: Context, reminderId: Int, payload: String?) {
        Log.d("PawPal", "Skip action for reminder: $reminderId")
        sendToFlutter("notificationAction", mapOf(
            "action" to "skip",
            "reminderId" to reminderId,
            "payload" to payload
        ))
    }

    private fun sendToFlutter(method: String, arguments: Map<String, Any?>) {
        // This will be received by the Flutter MethodChannel handler
        val intent = Intent("com.pawpal.app.NOTIFICATION_ACTION")
        intent.putExtra("method", method)
        arguments.forEach { (key, value) ->
            when (value) {
                is Int -> intent.putExtra(key, value)
                is String -> intent.putExtra(key, value)
                else -> intent.putExtra(key, value.toString())
            }
        }
        ContextCompat.sendBroadcast(context, intent)
    }
}