class AllDresses {
  String categories;
  String image;
  String name;
  double price;
  double offer;
  bool isFave;
  AllDresses({
    required this.image,
    required this.name,
    required this.price,
    required this.categories,
    required this.offer,
    this.isFave = false,
  });
}
