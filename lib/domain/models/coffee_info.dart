class CoffeeModel {
  final String name;
  final double price;
  final String image;
  final String rating;
  final String category;

  CoffeeModel({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      name: json['name'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'],
      category: json['category'],
    );
  }
}
