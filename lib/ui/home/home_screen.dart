import 'package:flutter/material.dart';
import 'package:flutter_restaurant_delivery/data/categories_data.dart';
import 'package:flutter_restaurant_delivery/data/restaurant_data.dart';
import 'package:flutter_restaurant_delivery/ui/_core/widgets/appbar_widget.dart';
import 'package:flutter_restaurant_delivery/ui/home/widgets/category_widget.dart';
import 'package:flutter_restaurant_delivery/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text('Boas-vindas!'),
              TextFormField(),
              Text('Escolha por categoria'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text('Bem avaliados'),
              Column(
                spacing: 8,
                children: List.generate(
                  restaurantData.listRestaurant.length,
                  (index) => RestaurantWidget(
                    restaurant: restaurantData.listRestaurant[index],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
