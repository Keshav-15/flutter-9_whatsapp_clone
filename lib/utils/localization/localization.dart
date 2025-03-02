import 'package:flutter/material.dart';
import 'package:whatsapp/utils/local_storage.dart/local_storage.dart';
import 'package:whatsapp/utils/localization/localization_en.dart';
import 'package:whatsapp/utils/localization/localization_es.dart';
import 'package:whatsapp/utils/localization/localization_strings.dart';

class Localization {
  final Locale locale;
  late final LocalizedStrings strings;
  Localization(this.locale) {
    strings = getStrings(locale.languageCode);
  }

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  static const LocalizationsDelegate<Localization> delegate =
      _LocalizationDelegate();

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  static LocalizedStrings getStrings(String code) {
    switch (code) {
      case 'es':
        return LocalizationES();
      case 'en':
      default:
        return LocalizationEN();
    }
  }
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return Localization.supportedLocales
        .map((e) => e.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    return Localization(locale);
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}

class LocaleController extends ChangeNotifier {
  Locale _locale;
  LocaleController(this._locale);

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await LocaleStorage.saveLocale(locale);
    notifyListeners();
  }
}
