import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pages/bottom_navigation_bar.dart';
import 'routes/app_pages.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = HexColor('#0C78AE');

    // Create a ColorScheme based on the primary color for dark mode
    ColorScheme colorScheme = ColorScheme(
      primary: primaryColor,
      secondary: Colors.black87,
      surface: Colors.white, // Customize surface color
      background: Colors.black, // Customize background color
      error: Colors.red, // Customize error color
      onPrimary: Colors.white, // Customize text color on primary
      onSecondary: Colors.black, // Customize text color on secondary
      onSurface: Colors.white, // Customize text color on surface
      onBackground: Colors.white, // Customize text color on background
      onError: Colors.white, // Customize text color on error
      brightness: Brightness.dark, // Set it to dark mode
    );

    // Use the colorScheme in your theme
    ThemeData theme = ThemeData(
      colorScheme: colorScheme,
    );

    return GetMaterialApp(
      title: 'Tugas Unjuk Keterampilan',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: RouteName.splashScreen,
      getPages: AppPages.pages,
      home: BottomNavigationBarPage(),
    );
  }
}
