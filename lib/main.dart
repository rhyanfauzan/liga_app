import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_app/view/clubdetail_screen.dart';
import 'package:liga_app/view/clubs_screen.dart';
import 'package:liga_app/view/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/app_color.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/clubs': (context) => ClubsScreen(),
        '/clubdetail': (context) => ClubDetailScreen(),
      },
    );
  }
}
