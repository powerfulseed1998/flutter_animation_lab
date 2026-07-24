import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const AnimationLabApp());
}

class AnimationLabApp extends StatelessWidget {
  const AnimationLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Flutter 动画实验室',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        cardTheme: const CardThemeData(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(centerTitle: false),
      ),
      home: const HomePage(),
    );
  }
}
