import 'package:flutter/material.dart';
import 'package:whatsapp/utils/localization/localization.dart';

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
