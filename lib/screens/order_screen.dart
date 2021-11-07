import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_getx/controller/order_controller.dart';
import 'package:shopping_app_getx/widget/app_drawer.dart';
import 'package:shopping_app_getx/widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(orderController.orders[index])),
    );
  }
}
