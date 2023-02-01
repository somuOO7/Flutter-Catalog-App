import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/Pages/home_page.dart';
import 'package:flutter_course/Pages/login_page.dart';
import 'package:flutter_course/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/login',
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
