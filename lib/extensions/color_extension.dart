import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withCustomOpacity(double value) {
    // If value is <= 1, assume it's a fraction (0.0 to 1.0)
    // If value > 1, assume it's given on a 0 to 10 scale and normalize accordingly.
    double normalizedOpacity = value <= 1 ? value : (value.clamp(0, 10) / 10);
    return withAlpha((normalizedOpacity * 255).toInt());
  }
}
