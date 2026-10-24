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
