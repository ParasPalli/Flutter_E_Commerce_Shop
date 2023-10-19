// "id": 1,
// "title": "iPhone 9",
// "description": "An apple mobile which is nothing like apple",
// "price": 549,
// "discountPercentage": 12.96,
// "rating": 4.69,
// "stock": 94,
// "brand": "Apple",
// "category": "smartphones",
// "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
// "images" : []

class Products {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final String thumbnail;
  final List images;

  const Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      discountPercentage: json['discountPercentage'] as double,
      thumbnail: json['thumbnail'] as String,
      images: json['images'] as List,
    );
  }
}
