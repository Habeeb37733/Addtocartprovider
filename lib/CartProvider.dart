import 'package:flutter/cupertino.dart';

import 'CartItem.dart';

class CartModel extends ChangeNotifier {
  List<CartItem> _items = [];
  double _totalPrice = 0.0;

  List<CartItem> get items => _items;
  double get totalPrice => _totalPrice;

  void add(CartItem item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }
}