import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/view/cart_page.dart';

import '../model/product_model.dart';
import '../view_model/cart_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.add(Product(
            id: DateTime.now().second,
            name: "X Product",
            price: 20.0,
          ));
        },
        tooltip: "Add Product",
        child: Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text("Products"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    // Use the Consumer widget to listen for changes in CartProvider
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return ListView.builder(
          itemCount: provider.items.length,
          itemBuilder: (context, index) {
            Product product = provider.items[index];
            return ListTile(
              title: Text(product.name),
              trailing: Checkbox(
                value: provider.items.contains(product),
                onChanged: (value) {
                  value == true
                      ? provider.add(product)
                      : provider.remove(product);
                },
              ),
            );
          },
        );
      },
    );
  }
}

/*
. Consumer<CartProvider> is used to listen to changes in CartProvider. The builder function is called whenever the state in CartProvider changes.
. Inside the builder function, we have a ListView.builder that displays a list of products.
. For each product, a Checkbox is used to indicate whether the product is in the cart.
. The onChanged callback updates the cart state when the user checks or unchecks the Checkbox.
 */
