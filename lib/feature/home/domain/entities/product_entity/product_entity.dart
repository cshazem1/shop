
import 'package:hive/hive.dart';
part 'product_entity.g.dart';
@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)

  final String productTitle;
  @HiveField(1)

  final  num productPrice;
  @HiveField(2)

  final String productDescription;
  @HiveField(3)

  final List<String> productImage;

 const ProductEntity(
      {required this.productTitle,
      required this.productPrice,
      required this.productDescription,
      required this.productImage});
}
