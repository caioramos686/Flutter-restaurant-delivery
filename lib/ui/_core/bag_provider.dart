import 'package:flutter/material.dart';
import 'package:flutter_restaurant_delivery/model/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  void addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  void removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResul = {};

    for (Dish dish in dishesOnBag) {
      if (mapResul[dish] == null) {
        mapResul[dish] = 1;
      } else {
        mapResul[dish] = mapResul[dish]! + 1;
      }
    }
    return mapResul;
  }
}
