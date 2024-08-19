
import 'package:hive/hive.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

Future<void> saveProductsData(List<ProductEntity> products,String boxName) async {
  var box=Hive.box<ProductEntity>(boxName);
 await box.addAll(products);
}
