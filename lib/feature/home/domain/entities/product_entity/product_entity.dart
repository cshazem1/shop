class ProductEntity {
 final String productTitle;
final  num productPrice;
 final String productDescription;
 final List<String> productImage;

 const ProductEntity(
      {required this.productTitle,
      required this.productPrice,
      required this.productDescription,
      required this.productImage});
}
