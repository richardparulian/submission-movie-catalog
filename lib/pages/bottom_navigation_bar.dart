import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/c_menu.dart';
import '../controller/c_navigation.dart';
import 'download.dart';
import 'find.dart';
import 'home.dart';

class BottomNavigationBarPage extends StatelessWidget {
  final MenusController cMenu = Get.put(MenusController());
  final NavigationController cNavigation = Get.put(NavigationController());

  BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: DefaultTabController(
        initialIndex: cNavigation.currentIndexBottomMenu.value,
        length: cMenu.bottomMenu.length,
        child: Scaffold(
          body: Obx(() {
            return IndexedStack(
              index: cNavigation.currentIndexBottomMenu.value,
              children: [
                for (int i = 0; i < cMenu.bottomMenu.length; i++) buildTabContent(i),
              ],
            );
          }),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              items: cMenu.bottomMenu.asMap().entries.map((entry) {
                final menu = entry.value;
                
                return BottomNavigationBarItem(
                  label: menu['label'],
                  icon: Icon(menu['icon']),
                );
              }).toList(),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: cNavigation.currentIndexBottomMenu.value,
              onTap: (index) {
                cNavigation.changeIndexBottomMenu(index);
              },
            );
          }),
        ),
      ),
    );
  }

  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return DownloadPage();
      case 2:
        return FindPage();
      default:
        return Container();
    }
  }
}