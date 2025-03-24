import 'package:flutter/material.dart';
import 'package:whatsapp/extensions/localization_extension.dart';
import 'package:whatsapp/extensions/string_extension.dart';
import 'package:whatsapp/models/bottom_navigation_item.dart';
import 'package:whatsapp/utils/constants/constant_images.dart';
import 'package:whatsapp/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<BottomNavigationItem> _bottomNavigationBarItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeBottomNavItems();
  }

  void _initializeBottomNavItems() {
    _bottomNavigationBarItems = [
      BottomNavigationItem(
        icon: ConstantImages.chats,
        iconSelected: ConstantImages.chatsSelected,
        title: context.loc.chats.capitalizeFirstLetter(),
      ),
      BottomNavigationItem(
        icon: ConstantImages.updates,
        iconSelected: ConstantImages.updatesSelected,
        title: context.loc.updates.capitalizeFirstLetter(),
      ),
      BottomNavigationItem(
        icon: ConstantImages.communities,
        iconSelected: ConstantImages.communitiesSelected,
        title: context.loc.communities.capitalizeFirstLetter(),
      ),
      BottomNavigationItem(
        icon: ConstantImages.calls,
        iconSelected: ConstantImages.callsSelected,
        title: context.loc.calls.capitalizeFirstLetter(),
      ),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: ClampingScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: List.generate(_bottomNavigationBarItems.length, (index) {
          return _buildPage(index, context);
        }),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _bottomNavigationBarItems,
      ),
    );
  }

  Widget _buildPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        return _buildPageContent(
            "${_bottomNavigationBarItems[index].title} Page",
            Colors.redAccent,
            context);
      case 1:
        return _buildPageContent(
            "${_bottomNavigationBarItems[index].title} Page",
            Colors.amber,
            context);
      case 2:
        return _buildPageContent(
            "${_bottomNavigationBarItems[index].title} Page",
            Colors.greenAccent,
            context);
      case 3:
        return _buildPageContent(
            "${_bottomNavigationBarItems[index].title} Page",
            Colors.blueAccent,
            context);
      default:
        return _buildPageContent("Page", Colors.grey, context);
    }
  }

  Widget _buildPageContent(String title, Color color, BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
