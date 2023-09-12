import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/Auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'IBMPlexSans',
        useMaterial3: true,
      ),
      home: const Login_Screen(),
      // home: const HomePage(),
      // home: const HomePage(),
      // home: const HomePage(),
    );
  }
}

