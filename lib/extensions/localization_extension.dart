import 'package:flutter/material.dart';
import 'package:whatsapp/utils/localization/localization.dart';
import 'package:whatsapp/utils/localization/localization_strings.dart';

extension LocalizationExtension on BuildContext {
  LocalizationStrings get loc => Localization.of(this).strings;
}
