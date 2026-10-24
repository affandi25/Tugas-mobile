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
