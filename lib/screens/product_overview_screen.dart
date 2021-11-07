import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_getx/controller/cart_controller.dart';
import 'package:shopping_app_getx/screens/cart_screen.dart';
import 'package:shopping_app_getx/widget/app_drawer.dart';
import 'package:shopping_app_getx/widget/productgrid.dart';

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: [
          GetBuilder<CartController>(
              init: CartController(),
              builder: (_) {
                return Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Get.to(CartScreen());
                    },
                  ),
                  badgeContent: Text(cartController.itemCount.toString()),
                  badgeColor: Theme.of(context).colorScheme.secondary,
                  position: BadgePosition.topEnd(top: 2, end: 4),
                );
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}
