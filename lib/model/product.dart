class Product {
  final String category;
  final String description;
  final int id;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final int price;
  final int productCount;
  final String title;

  Product({
    required this.category,
    required this.description,
    required this.id,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    required this.price,
    required this.productCount,
    required this.title,
  });
}
