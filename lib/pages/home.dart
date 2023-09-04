import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/c_menu.dart';
import '../controller/c_navigation.dart';
import '../controller/c_public.dart';
import 'component_home/list_all.dart';
import 'component_home/list_movies.dart';
import 'component_home/list_tv.dart';

class HomePage extends StatelessWidget {
  final PublicController cPublic = Get.put(PublicController());
  final MenusController cMenu = Get.put(MenusController());
  final NavigationController cNavigation = Get.put(NavigationController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: cNavigation.currentIndexTopMenu.value,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          titleSpacing: 3.0,
          title: Image.asset(cPublic.splashImage.toString(), width: 70.0),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(cPublic.userImage.toString()),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                indicator: null,
                indicatorColor: Colors.transparent,
                splashBorderRadius: const BorderRadius.all(Radius.circular(50.0)),
                onTap: (index) {
                  cNavigation.changeIndexTopMenu(index);
                },
                tabs: cMenu.topMenu.asMap().entries.map((entry) {
                  final index = entry.key;
                  final menu = entry.value;

                  return CustomTab(
                    text: menu['label'],
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    isIndex: index,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        body: Obx(() {
          return IndexedStack(
            index: cNavigation.currentIndexTopMenu.value,
            children: [
              for (int i = 0; i < 3; i++) buildTabContent(i),
            ],
          );
        }),
      ),
    );
  }

  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
        return ListAllMoviesTvPage();
      case 1:
        return ListMoviesPage();
      case 2:
        return ListTvPage();
      default:
        return Container();
    }
  }
}

class CustomTab extends StatelessWidget {
  final NavigationController cNavigation = Get.put(NavigationController());
  final String text;
  final BorderRadiusGeometry borderRadius;
  final int isIndex;

  CustomTab({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.isIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() { 
      return Container(
        height: 35.0,
        decoration: BoxDecoration(
          color: isIndex == cNavigation.currentIndexTopMenu.value ? Colors.white : Colors.transparent,
          borderRadius: borderRadius,
        ),
        child: Tab(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              style: TextStyle(
                color: isIndex == cNavigation.currentIndexTopMenu.value ? Colors.black : Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
