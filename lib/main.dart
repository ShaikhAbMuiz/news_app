import 'package:flutter/material.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/onboarding.dart/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Feed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingScreen()
    );
  }
}
