import 'package:get/get.dart';
import 'package:shopping_app_getx/models/product.dart';

class ProductController extends GetxController {
  List<Product> _items = [
    Product(
      id: 1,
      productTitle: 'Sport Shoe',
      description: 'Made for you Check it out!',
      price: 7000.00,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Cavalier-Black-1.jpg?v=1589391819',
    ),
    Product(
        id: 2,
        productTitle: 'Legend',
        description:
            'Built to last forever, StormKing™ lug rubber outsoles and a flexible elastic goring, this can only be for the Legends and i bet you, you have not seen it anywhere.',
        price: 63000.00,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Legend-BlackMatte-3.4_672x672.jpg?v=1600886623'),
    Product(
        id: 3,
        productTitle: 'The Chelsea',
        description: 'Functional and Fashionable.',
        price: 49.00,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Cavalier-Black-1.jpg?v=1589391819'),
    Product(
        id: 4,
        productTitle: 'Men\'s Sneakers',
        description: 'Clean & Comfortable Sneakers made with classic Leathers.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679'),
    Product(
        id: 5,
        productTitle: 'The Chelsea',
        description:
            'Comfortable as you\'d expect.This can only be found at Resilient collection.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Captain-Natural-3.jpg?v=1584114360'),
    Product(
        id: 6,
        productTitle: 'Men\'s Sneakers',
        description: 'Clean & Comfortable Sneakers made with classic Leathers.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679'),
    Product(
        id: 7,
        productTitle: 'The Chelsea',
        description:
            'Made for the men who understand what classic means, every bit was carefully selected so you can go the extra mile with confidence and alacrity.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-2.jpg?v=1618424894'),
    Product(
        id: 8,
        productTitle: 'Men\'s Sneakers',
        description: 'Clean & Comfortable Sneakers made with classic Leathers.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-Cavalier-Toffee-210402-3.jpg?v=1618424894'),
    Product(
        id: 9,
        productTitle: 'The Chelsea',
        description: 'Functional and Fashionable.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Cavalier-Black-1.jpg?v=1589391819'),
    Product(
        id: 10,
        productTitle: 'Men\'s Sneakers',
        description: 'Clean & Comfortable Sneakers made with classic Leathers.',
        price: 49.99,
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0419/1525/products/1024x1024-Men-PremierLowTop-Black-3.4.jpg?v=1600270679'),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((element) => element.isFavourite).toList();
  }

  Product findProductById(int id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void toggleFavouriteStatus(int id) {
    _items[id].isFavourite = !_items[id].isFavourite;
    update();
  }
}
