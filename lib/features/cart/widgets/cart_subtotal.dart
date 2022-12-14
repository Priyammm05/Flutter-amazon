// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSubtotal extends StatelessWidget {
  const CartSubtotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    double sum = 0;
    user.cart.map((e) => sum += e['quantity'] * e['product']['price']).toList();

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            'Subtotal ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '\$ ${sum.ceil()}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
