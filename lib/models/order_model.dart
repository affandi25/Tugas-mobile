import 'product_model.dart';
import 'topping_model.dart';

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
