import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controlar.dart';

class ShoppingCartPage extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(child: Text("Your cart is empty"));
        }
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Image.network(item.cover, width: 50, fit: BoxFit.cover),
                title: Text(item.title),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () => controller.removeFromCart(item),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
