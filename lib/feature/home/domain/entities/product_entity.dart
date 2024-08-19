class ProductEntity {
  String title;
  num price;
  String description;
  List<String> image;

  ProductEntity(
      {required this.title,
      required this.price,
      required this.description,
      required this.image});
}
