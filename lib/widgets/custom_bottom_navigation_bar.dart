import 'package:flutter/material.dart';
import 'package:whatsapp/extensions/theme_extension.dart';
import 'package:whatsapp/models/bottom_navigation_item.dart';
import 'package:whatsapp/widgets/custom_icon.dart';

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
    return Theme(
      data: context.currentTheme.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: List.generate(items.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomIcon(
              icon: items[index].icon,
              iconSelected: items[index].iconSelected,
              index: index,
              currentIndex: currentIndex,
            ),
            label: items[index].title,
          );
        }),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
