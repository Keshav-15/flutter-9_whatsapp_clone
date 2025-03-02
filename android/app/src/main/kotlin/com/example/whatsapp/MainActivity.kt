package com.example.whatsapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.locale"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val prefs = getSharedPreferences("locale", MODE_PRIVATE)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getKey" -> {
                        val key = call.argument<String>("key")
                        // Retrieve the value for the given key from SharedPreferences.
                        val value = key?.let { prefs.getString(it, null) }
                        result.success(value)
                    }
                    "setKey" -> {
                        val key = call.argument<String>("key")
                        val value = call.argument<String>("value")
                        if (key != null) {
                            prefs.edit().putString(key, value).apply()
                            result.success(null)
                        } else {
                            result.error("INVALID_ARGUMENT", "Key is null", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }
}
