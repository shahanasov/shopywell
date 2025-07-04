import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/core/constants/theme/app_theme.dart';
import 'package:shopywell/screens/onboarding/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'Shopywell',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}