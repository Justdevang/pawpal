package com.pawpal.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
import androidx.localbroadcastmanager.content.LocalBroadcastManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.pawpal.app/notifications"
    private var actionReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "scheduleNotification" -> scheduleNotification(call, result)
                "cancelNotification" -> cancelNotification(call, result)
                "cancelAllNotifications" -> cancelAllNotifications(result)
                "getPendingNotifications" -> getPendingNotifications(result)
                "requestExactAlarmPermission" -> requestExactAlarmPermission(result)
                "canScheduleExactAlarms" -> canScheduleExactAlarms(result)
                "rescheduleAllNotifications" -> rescheduleAllNotifications(result)
                else -> result.notImplemented()
            }
        }

        // Register local broadcast receiver for notification actions
        registerActionReceiver()
    }

    private fun registerActionReceiver() {
        actionReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val method = intent.getStringExtra("method")
                val reminderId = intent.getIntExtra("reminderId", -1)
                val action = intent.getStringExtra("action")
                val payload = intent.getStringExtra("payload")

                if (method == "notificationAction" && reminderId != -1) {
                    val arguments = mapOf(
                        "action" to action,
                        "reminderId" to reminderId,
                        "payload" to payload
                    )
                    val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                    channel.invokeMethod("onNotificationAction", arguments)
                }
            }
        }

        val filter = IntentFilter("com.pawpal.app.NOTIFICATION_ACTION")
        LocalBroadcastManager.getInstance(this).registerReceiver(actionReceiver!!, filter)
    }

    private fun scheduleNotification(call: MethodCall, result: MethodChannel.Result) {
        val id = call.argument<Int>("id") ?: return result.error("INVALID_ID", "Missing id", null)
        val title = call.argument<String>("title") ?: ""
        val body = call.argument<String>("body") ?: ""
        val scheduledDate = call.argument<Long>("scheduledDate") ?: return result.error("INVALID_DATE", "Missing date", null)
        val payload = call.argument<String>("payload")
        val isExact = call.argument<Boolean>("isExact") ?: true

        // Use flutter_local_notifications plugin via method channel
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.dexterous.flutterlocalnotifications")
        channel.invokeMethod("zonedSchedule", mapOf(
            "id" to id,
            "title" to title,
            "body" to body,
            "scheduledDate" to scheduledDate,
            "payload" to payload,
            "androidScheduleMode" to (if (isExact) "exactAllowWhileIdle" else "inexactAllowWhileIdle"),
            "matchDateTimeComponents" to "time"
        )).then { result.success(it) }.catch { result.error("SCHEDULE_FAILED", it.message, null) }
    }

    private fun cancelNotification(call: MethodCall, result: MethodChannel.Result) {
        val id = call.argument<Int>("id") ?: return result.error("INVALID_ID", "Missing id", null)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.dexterous.flutterlocalnotifications")
        channel.invokeMethod("cancel", id).then { result.success(it) }.catch { result.error("CANCEL_FAILED", it.message, null) }
    }

    private fun cancelAllNotifications(result: MethodChannel.Result) {
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.dexterous.flutterlocalnotifications")
        channel.invokeMethod("cancelAll", null).then { result.success(it) }.catch { result.error("CANCEL_ALL_FAILED", it.message, null) }
    }

    private fun getPendingNotifications(result: MethodChannel.Result) {
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.dexterous.flutterlocalnotifications")
        channel.invokeMethod("pendingNotificationRequests", null).then { result.success(it) }.catch { result.error("PENDING_FAILED", it.message, null) }
    }

    private fun requestExactAlarmPermission(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val alarmManager = getSystemService(Context.ALARM_SERVICE) as android.app.AlarmManager
            val canSchedule = alarmManager.canScheduleExactAlarms()
            if (!canSchedule) {
                val intent = Intent(android.provider.Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM)
                startActivityForResult(intent, 1234, null)
            }
            result.success(canSchedule)
        } else {
            result.success(true)
        }
    }

    private fun canScheduleExactAlarms(result: MethodChannel.Result) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val alarmManager = getSystemService(Context.ALARM_SERVICE) as android.app.AlarmManager
            result.success(alarmManager.canScheduleExactAlarms())
        } else {
            result.success(true)
        }
    }

    private fun rescheduleAllNotifications(result: MethodChannel.Result) {
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.invokeMethod("rescheduleAllFromNative", null)
        result.success(true)
    }

    override fun onDestroy() {
        if (actionReceiver != null) {
            LocalBroadcastManager.getInstance(this).unregisterReceiver(actionReceiver!!)
        }
        super.onDestroy()
    }
}