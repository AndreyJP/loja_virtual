class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final String thumbnail;
  final List images;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      images: json['images'],
    );
  }
}
