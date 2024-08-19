import '../../domain/entities/product_entity/product_entity.dart';

abstract class HomeLocalDataSource {

  Future<List<ProductEntity>> fetchFeatureProduct();
  Future<List<ProductEntity>> fetchFeatureCategory();

}