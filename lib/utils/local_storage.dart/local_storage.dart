import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocaleStorage {
  static const MethodChannel _channel = MethodChannel('com.example.locale');

  static Future<dynamic> getKey(String key) async {
    try {
      return await _channel.invokeMethod('getKey', {'key': key});
    } catch (e) {
      debugPrint('Error getting key: $e');
      return null;
    }
  }

  static Future<void> setKey(String key, dynamic value) async {
    try {
      await _channel.invokeMethod('setKey', {'key': key, 'value': value});
    } catch (e) {
      debugPrint('Error setting key: $e');
    }
  }

  static Future<void> saveLocale(Locale locale) async {
    await setKey('language_code', locale.languageCode);
    await setKey('country_code', locale.countryCode ?? '');
  }

  static Future<Locale> loadLocale() async {
    final languageCode = await getKey('language_code') ?? 'en';
    final countryCode = await getKey('country_code') ?? 'US';
    return Locale(languageCode, countryCode);
  }
}
