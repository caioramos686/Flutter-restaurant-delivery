import 'package:flutter/material.dart';
import 'package:flutter_restaurant_delivery/ui/_core/app_theme.dart';
import 'package:flutter_restaurant_delivery/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), theme: AppTheme.appTheme);
  }
}
