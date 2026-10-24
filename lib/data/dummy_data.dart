import '../models/order_model.dart';
import '../models/product_model.dart';
import '../models/topping_model.dart';

class DummyData {
  // 6 Varian Rasa dari Figma
  static const List<ProductModel> products = [
    ProductModel(
      id: 'p1',
      name: 'Rasa Coklat',
      price: 20000,
      imagePath: 'asset/rasa_coklat.png',
      description: 'Donat lezat dengan lelehan coklat premium yang kaya rasa.',
      isBestSeller: true,
    ),
    ProductModel(
      id: 'p2',
      name: 'Rasa Strawberi',
      price: 20000,
      imagePath: 'asset/rasa_strawberi.png',
      description: 'Perpaduan manis dan segar buah strawberi alami.',
      isBestSeller: false,
    ),
    ProductModel(
      id: 'p3',
      name: 'Rasa Taro',
      price: 23000,
      imagePath: 'asset/rasa_taro.png',
      description: 'Cita rasa khas talas ungu lembut yang creamy.',
      isBestSeller: true,
    ),
    ProductModel(
      id: 'p4',
      name: 'Rasa Matcha',
      price: 22000,
      imagePath: 'asset/rasa_matcha.png',
      description: 'Matcha hijau autentik dengan aroma teh menenangkan.',
      isBestSeller: true,
    ),
    ProductModel(
      id: 'p5',
      name: 'Rasa Tiramizu',
      price: 23000,
      imagePath: 'asset/rasa_tiramizu.png',
      description: 'Aroma kopi espresso berpadu keju mascarpone lembut.',
      isBestSeller: false,
    ),
    ProductModel(
      id: 'p6',
      name: 'Mix Rasa',
      price: 25000,
      imagePath: 'asset/mix_rasa.png',
      description: 'Kombinasi aneka rasa favorit dalam satu sajian istimewa.',
      isBestSeller: true,
    ),
  ];

  // 5 Topping Pilihan dari Figma
  static const List<ToppingModel> toppings = [
    ToppingModel(id: 't1', name: 'Oreo', price: 3000),
    ToppingModel(id: 't2', name: 'Chocochip', price: 3000),
    ToppingModel(id: 't3', name: 'Sprinkle', price: 3000),
    ToppingModel(id: 't4', name: 'Kacang almond', price: 4000),
    ToppingModel(id: 't5', name: 'Keju', price: 3000),
  ];

  // Mock Pesanan Aktif untuk My Order Screen (Sesuai Figma #125:670)
  static List<OrderItemModel> sampleOrders = [
    const OrderItemModel(
      product: ProductModel(
        id: 'p1',
        name: 'Rasa Coklat',
        price: 20000,
        imagePath: 'asset/rasa_coklat.png',
      ),
      toppings: [ToppingModel(id: 't1', name: 'Oreo', price: 3000)],
      quantity: 2,
      status: 'delivery',
    ),
    const OrderItemModel(
      product: ProductModel(
        id: 'p5',
        name: 'Rasa Tiramizu',
        price: 23000,
        imagePath: 'asset/rasa_tiramizu.png',
      ),
      toppings: [ToppingModel(id: 't1', name: 'Oreo', price: 3000)],
      quantity: 2,
      status: 'delivery',
    ),
    const OrderItemModel(
      product: ProductModel(
        id: 'p4',
        name: 'Rasa Matcha',
        price: 22000,
        imagePath: 'asset/rasa_matcha.png',
      ),
      toppings: [ToppingModel(id: 't1', name: 'Oreo', price: 3000)],
      quantity: 2,
      status: 'delivery',
    ),
    const OrderItemModel(
      product: ProductModel(
        id: 'p3',
        name: 'Rasa Taro',
        price: 23000,
        imagePath: 'asset/rasa_taro.png',
      ),
      toppings: [ToppingModel(id: 't1', name: 'Oreo', price: 3000)],
      quantity: 2,
      status: 'delivery',
    ),
  ];
}
