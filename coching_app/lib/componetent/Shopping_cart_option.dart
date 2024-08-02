import 'package:coching_app/utils/util.dart';
import 'package:flutter/material.dart';

class ShoppingCartOption extends StatelessWidget {
  const ShoppingCartOption({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Util.openShoppingCart(context);
      },
      child: const Icon(Icons.shopping_cart),
    );
  }
}
