import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_getx/controller/cart_controller.dart';
import 'package:shopping_app_getx/controller/order_controller.dart';
import 'package:shopping_app_getx/widget/cart_Items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '₦${cartController.TotalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (context) {
                          return TextButton(
                              onPressed: () {
                                orderController.addOrder(
                                    cartController.items.values.toList(),
                                    cartController.TotalAmount);
                                cartController.clear();
                                Get.snackbar(
                                  "Orders",
                                  "Orders placed successfully",
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM,
                                  margin: EdgeInsets.only(
                                      bottom: 10, right: 10, left: 10),
                                );
                              },
                              child: Text('ORDER NOW'));
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.items.length,
                itemBuilder: (context, index) => CartItem(
                  id: cartController.items.values.toList()[index].id,
                  price:
                      cartController.items.values.toList()[index].productPrice,
                  quantity: cartController.items.values
                      .toList()[index]
                      .productQuantity,
                  title:
                      cartController.items.values.toList()[index].productTitle,
                  productId: cartController.items.keys.toList()[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
