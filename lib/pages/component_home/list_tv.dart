import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/c_home.dart';
import '../../utils/api_endpoint.dart';

class ListTvPage extends StatelessWidget {
  final HomeController cHome = Get.put(HomeController());
  ListTvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0),
            RichText(
              text: TextSpan(
                text: 'Prime ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                children: const [
                  TextSpan(
                    text: '- Amazon TV Shows Popular', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Obx(() {
              if (cHome.tvShowsPopular.isEmpty) {
                return const CupertinoActivityIndicator(
                  radius: 15.0, 
                  animating: true, 
                );
              } else {
                return CarouselSlider.builder(
                  itemCount: cHome.tvShowsPopular.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    final item = cHome.tvShowsPopular[index];
                    
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        child: CachedNetworkImage(
                          imageUrl: '${ApiEndPoints.baseUrlImage}${item.posterPath}', 
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              ),
                            );
                          }
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    viewportFraction: 0.50,  // Adjust to control the visible fraction
                    aspectRatio: 1.5,
                    autoPlay: false,
                    animateToClosest: true,
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            }),
            const SizedBox(height: 20.0),
            RichText(
              text: TextSpan(
                text: 'Prime ',
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                children: const [
                  TextSpan(
                    text: '- Amazon TV Shows Top Rated', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Obx(() {
              if (cHome.tvShowsTopRated.isEmpty) {
                return const CupertinoActivityIndicator(
                  radius: 15.0, 
                  animating: true, 
                );
              } else {
                return CarouselSlider.builder(
                  itemCount: cHome.tvShowsTopRated.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    final item = cHome.tvShowsTopRated[index];
                    
                    return Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        child: CachedNetworkImage(
                          imageUrl: '${ApiEndPoints.baseUrlImage}${item.posterPath}', 
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 15.0, 
                                animating: true, 
                              ),
                            );
                          }
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    viewportFraction: 0.50,  // Adjust to control the visible fraction
                    aspectRatio: 1.5,
                    autoPlay: false,
                    animateToClosest: true,
                    reverse: false,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            }),
          ],
        )
      ),
    );
  }
}