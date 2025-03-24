import 'package:flutter/material.dart';
import 'package:whatsapp/extensions/color_extension.dart';
import 'package:whatsapp/extensions/theme_extension.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final String iconSelected;
  final int index;
  final int currentIndex;

  const CustomIcon({
    super.key,
    required this.icon,
    required this.iconSelected,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = currentIndex == index;
    final iconColor = isSelected
        ? context.colorScheme.onSurface.withCustomOpacity(0.65)
        : context.colorScheme.onSurface.withCustomOpacity(0.8);

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      padding:
          EdgeInsets.symmetric(vertical: 5, horizontal: isSelected ? 20 : 0),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.secondary.withCustomOpacity(0.3)
            : null,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(40),
          right: Radius.circular(40),
        ),
      ),
      child: Image.asset(
        isSelected ? iconSelected : icon,
        width: 25,
        color: iconColor,
      ),
    );
  }
}
