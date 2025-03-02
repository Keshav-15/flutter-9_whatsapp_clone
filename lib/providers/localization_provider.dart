import 'package:flutter/material.dart';
import 'package:whatsapp/utils/local_storage.dart/local_storage.dart';

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

/// An InheritedWidget that exposes LocaleController to the widget tree.
class LocaleProvider extends InheritedNotifier<LocaleController> {
  final LocaleController localeController;
  const LocaleProvider({
    super.key,
    required this.localeController,
    required super.child,
  }) : super(notifier: localeController);

  /// Retrieves the LocaleController from the nearest LocaleProvider.
  static LocaleController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<LocaleProvider>();
    assert(provider != null, 'No LocaleProvider found in context');
    return provider!.localeController;
  }
}
