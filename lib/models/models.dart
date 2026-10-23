class ProductModel {
  final String id;
  final String name;
  final int price;
  final String imagePath;
  final String description;
  final bool isBestSeller;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.imagePath = '',
    this.description = '',
    this.isBestSeller = false,
  });
}

class ToppingModel {
  final String id;
  final String name;
  final int price;

  const ToppingModel({
    required this.id,
    required this.name,
    this.price = 3000,
  });
}

class OrderItemModel {
  final ProductModel product;
  final List<ToppingModel> toppings;
  final int quantity;
  final String status;

  const OrderItemModel({
    required this.product,
    required this.toppings,
    required this.quantity,
    this.status = 'delivery',
  });

  int get totalPrice {
    final toppingTotal = toppings.fold(0, (sum, t) => sum + t.price);
    return (product.price + toppingTotal) * quantity;
  }
}
