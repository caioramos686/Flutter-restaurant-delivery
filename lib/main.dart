import 'package:flutter/material.dart';
import 'package:flutter_restaurant_delivery/data/restaurant_data.dart';
import 'package:flutter_restaurant_delivery/ui/_core/app_theme.dart';
import 'package:flutter_restaurant_delivery/ui/_core/bag_provider.dart';
import 'package:flutter_restaurant_delivery/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => restaurantData),
        ChangeNotifierProvider(create: (conext) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
