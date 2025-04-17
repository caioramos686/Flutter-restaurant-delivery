import 'package:flutter/material.dart';
import 'package:flutter_restaurant_delivery/model/dish.dart';
import 'package:flutter_restaurant_delivery/model/restaurant.dart';
import 'package:flutter_restaurant_delivery/ui/_core/bag_provider.dart';
import 'package:flutter_restaurant_delivery/ui/_core/widgets/appbar_widget.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Center(
            child: Image.asset('assets/${restaurant.imagePath}', width: 100),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Mais pedidos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: List.generate(restaurant.dishes.length, (index) {
              Dish dish = restaurant.dishes[index];
              return ListTile(
                onTap: () {},
                leading: Image.asset('assets/dishes/default.png', width: 48),
                title: Text(dish.name),
                subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<BagProvider>().addAllDishes([dish]);
                  },
                  icon: Icon(Icons.add),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
