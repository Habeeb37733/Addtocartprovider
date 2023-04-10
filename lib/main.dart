import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartProvider.dart';
import 'CartUi.dart';

void main() {
  final cart = CartModel();
  runApp(CartProvider(cart: cart));
}
class CartProvider extends StatelessWidget {
  final CartModel cart;

  CartProvider({required this.cart});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cart,
      child: MaterialApp(
        title: 'Shopping Cart',
        home: ShoppingCart(),
      ),
    );
  }
}






