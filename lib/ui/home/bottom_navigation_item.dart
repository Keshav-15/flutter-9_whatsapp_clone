import 'package:flutter/material.dart';
import 'package:whatsapp/extensions/color_extension.dart';
import 'package:whatsapp/extensions/theme_extension.dart';
import 'package:whatsapp/widgets/custom_icon.dart';

class BottomNavigationItem {
  final String icon;
  final String iconSelected;
  final String title;

  const BottomNavigationItem({
    required this.icon,
    required this.iconSelected,
    required this.title,
  });
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.colorScheme.onSurface;
    final unselectedColor =
        context.colorScheme.onSurface.withCustomOpacity(0.6);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
      onTap: onTap,
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: CustomIcon(
            index: items.indexOf(item),
            currentIndex: currentIndex,
            icon: item.icon,
            iconSelected: item.iconSelected,
          ),
          label: item.title,
        );
      }).toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}
