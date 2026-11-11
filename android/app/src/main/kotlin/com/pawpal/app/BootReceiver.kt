package com.pawpal.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.PeriodicWorkRequest
import androidx.work.WorkManager
import java.util.concurrent.TimeUnit

/**
 * Boot receiver to reschedule notifications after device reboot
 */
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED ||
            intent.action == Intent.ACTION_LOCKED_BOOT_COMPLETED) {
            Log.d("PawPal", "Boot completed - rescheduling notifications")
            rescheduleNotifications(context)
        }
    }

    private fun rescheduleNotifications(context: Context) {
        // Start the periodic work to check and reschedule reminders
        val workRequest = PeriodicWorkRequest.Builder(NotificationRescheduleWorker::class.java, 15, TimeUnit.MINUTES)
            .setInitialDelay(1, TimeUnit.MINUTES)
            .build()

        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            "rescheduleNotifications",
            ExistingPeriodicWorkPolicy.KEEP,
            workRequest
        )
    }
}

/**
 * Worker to periodically check and reschedule notifications
 * Handles Android exact alarm limits and iOS 64-notification limit
 */
class NotificationRescheduleWorker : CoroutineWorker() {
    override suspend fun doWork(): Result = try {
        Log.d("PawPal", "Reschedule worker running")

        // Get all pending reminders from database
        // Reschedule notifications for the next window
        // This is called periodically to keep notifications within limits

        // Notify Flutter to reschedule
        sendToFlutter("rescheduleNotifications", emptyMap())

        Result.success()
    } catch (e: Exception) {
        Log.e("PawPal", "Reschedule worker failed", e)
        Result.retry()
    }

    private fun sendToFlutter(method: String, arguments: Map<String, Any?>) {
        val intent = Intent("com.pawpal.app.NOTIFICATION_ACTION")
        intent.putExtra("method", method)
        arguments.forEach { (key, value) ->
            when (value) {
                is Int -> intent.putExtra(key, value)
                is String -> intent.putExtra(key, value)
                else -> intent.putExtra(key, value.toString())
            }
        }
        context.sendBroadcast(intent)
    }
}