import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../view_model/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Cart"),
    );
  }

  Widget _buildUI() {
    // Use the Consumer widget to listen for changes in CartProvider
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Product product = provider.items[index];
                  return ListTile(
                    title: Text(product.name),
                    trailing: Text(product.price.toString()),
                    leading: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        provider.remove(product);
                      },
                    ),
                  );
                },
              ),
            ),
            Text(
              "Cart Total: \$${provider.getCartTotal().round()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
