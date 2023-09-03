import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/controller/c_public.dart';
import '../routes/routes.dart';

class SplashScreenPage extends StatelessWidget {
  final PublicController cPublic = Get.put(PublicController());

  SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PublicController>(
      initState: (context) {
        Timer(const Duration(seconds: 1), () {
          Get.offAllNamed(RouteName.home);
        });
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Hero(
                tag: "Splash Screen",
                child: Image.asset(cPublic.splashImage.toString(), width: 200.0),
              ),
          ),
        );
      },
    );
  }
}