
import 'package:hive/hive.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';

Future<void> saveCategoriesData(List<CategoryEntity> categories,String boxName) async {
  var box=Hive.box<CategoryEntity>(boxName);
 await box.addAll(categories);
}
