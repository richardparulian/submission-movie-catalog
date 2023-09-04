import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controller/c_home.dart';
import '../controller/c_menu.dart';
import '../controller/c_navigation.dart';
import '../controller/c_public.dart';
import '../utils/api_endpoint.dart';
import 'component_home/list_all.dart';
import 'component_home/list_movies.dart';
import 'component_home/list_tv.dart';

class HomePage extends StatelessWidget {
  final PublicController cPublic = Get.put(PublicController());
  final MenusController cMenu = Get.put(MenusController());
  final NavigationController cNavigation = Get.put(NavigationController());
  final HomeController cHome = Get.put(HomeController());

  _loadData() async {
    await Get.find<HomeController>().fetchAllTrending();
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _loadData();

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
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0),
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
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: [
                  Obx(() {
                    if (cHome.allTrending.isEmpty) {
                      return const CupertinoActivityIndicator(
                        radius: 15.0, 
                        animating: true, 
                      );
                    } else {
                      return CarouselSlider.builder(
                        itemCount: cHome.allTrending.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          final item = cHome.allTrending[index];
                          
                          return CachedNetworkImage(
                            imageUrl: '${ApiEndPoints.baseUrlImage}${item.backdropPath}', 
                            fit: BoxFit.cover, 
                            width: double.infinity,
                            progressIndicatorBuilder: (context, url, downloadProgress) {
                              return const CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              );
                            }
                          );
                        },
                        options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          aspectRatio: 2.0,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          viewportFraction: 1,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            cHome.currentIndexSliders.value = index;
                          },
                        ),
                      );
                    }
                  }),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cHome.allTrending.map((image) {
                        int index = cHome.allTrending.indexOf(image);
                        
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cHome.currentIndexSliders.value == index ? Colors.blueAccent : Colors.grey,
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 1200.0,
              child: Obx(() {
                return IndexedStack(
                  index: cNavigation.currentIndexTopMenu.value,
                  children: [
                    for (int i = 0; i < 3; i++) buildTabContent(i),
                  ],
                );
              }),
            ),
          ],
        ),
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
