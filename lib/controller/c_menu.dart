import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenusController extends GetxController {
  RxList<Map<String, dynamic>> topMenu = [
    {
      'id': 1,
      'label': "All",
    },
    {
      'id': 2,
      'label': "Movies",
    },
    {
      'id': 3,
      'label': "TV shows",
    },
  ].obs;

  RxList<Map<String, dynamic>> bottomMenu = [
    {
      'id': 1,
      'label': "Home",
      'icon': Icons.home_rounded
    },
    {
      'id': 2,
      'label': "Downloads",
      'icon': Icons.download_rounded
    },
    {
      'id': 3,
      'label': "Find",
      'icon': Icons.search_rounded
    },
  ].obs;
}