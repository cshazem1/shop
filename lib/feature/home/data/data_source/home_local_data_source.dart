import 'package:hive/hive.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';

import '../../../../constants.dart';
import '../../domain/entities/product_entity/product_entity.dart';

abstract class HomeLocalDataSource {
  List<ProductEntity> fetchFeatureProduct();
  List<CategoryEntity> fetchFeatureCategory();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<CategoryEntity> fetchFeatureCategory() {
    var box = Hive.box<CategoryEntity>(kCategoryBox);

    return box.values.toList();
  }

  @override
  List<ProductEntity> fetchFeatureProduct() {
    var box = Hive.box<ProductEntity>(kProductBox);

    return box.values.toList();
  }
}
