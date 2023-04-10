import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartItem.dart';
import 'CartProvider.dart';

class ShoppingCart extends StatelessWidget {
TextEditingController prodname= TextEditingController();
TextEditingController Quantity= TextEditingController();
TextEditingController price= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: context.select((CartModel cart) {
                if (cart.items.isEmpty) {
                  return Center(
                    child: Container(
                     width: MediaQuery.of(context).size.width/2,
                      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Product Name:"),
                              Expanded(
                                child: TextField(
                                  controller: prodname,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Quantity:"),
                              Expanded(
                                child: TextField(
                                  controller: Quantity,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Price:"),
                              Expanded(
                                child: TextField(
                                  controller: price,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        title: Text(item.productName, style: TextStyle(color: Colors.black)),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Text('\$${item.price}'),
                      );
                    },
                  );
                }
              }),
            ),


            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price:'),
                  Text(
                    '\$${context.select((CartModel cart) => cart.totalPrice)}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(

        onPressed: () {

      context.read<CartModel>().add(

          CartItem(
          productId: 1,
          productName: prodname.text,
          quantity:  int.parse(Quantity.text),
            price:  double.parse(price.text),
          ),
      );
        },
          child: Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

