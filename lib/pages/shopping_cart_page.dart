import 'package:flutter/material.dart';
import 'package:product/data/vos/product_vo/product_vo.dart';

import '../data/shopping_cart/shopping_cart.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final items = ShoppingCart.getCartItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text('Product ${item.title}'),
                  subtitle: Text("${item.price}"),
                  trailing: IconButton(
                  icon: const Icon(Icons.delete,color: Colors.red),
                  onPressed: () {
                    setState(() {
                      ShoppingCart.removeFromCart(index);
                    });
                  },
                ),
                );
              },
            ),
          ),
           Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                          'Total: \$${calculateTotalPrice(items).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                ),
              )
        ],
      ),
    );
  }

  double calculateTotalPrice(List<ProductVO> items) {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.price!;
    }
    return totalPrice;
  }

  
}
