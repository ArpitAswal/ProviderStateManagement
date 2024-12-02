import 'package:flutter/material.dart';

import '../model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;

  void add(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Product item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}

/*
. CartProvider extends ChangeNotifier, making it a provider class capable of notifying listeners when its state changes.
. _items is a list that holds the products in the cart.
. The add, remove, and removeAll methods modify the state and notify listeners.
. notifyListeners() triggers a rebuild in any widget that's listening to changes from this provider.
. getCartTotal calculates the total price of items in the cart.
 */
