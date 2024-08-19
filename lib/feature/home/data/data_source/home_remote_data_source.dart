
import 'package:shop/constants.dart';
import 'package:shop/core/utils/api_server.dart';
import 'package:shop/core/utils/function/save_products_data.dart';
import 'package:shop/feature/home/data/models/categories_model/category.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

import '../../../../core/utils/function/save_categories_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> fetchFeatureProduct();
  Future<List<CategoryEntity>> fetchFeatureCategory();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServer apiServer;
  HomeRemoteDataSourceImpl({required this.apiServer});
  @override
  Future<List<CategoryEntity>> fetchFeatureCategory() async {
    var result = await apiServer.get("categories/");
    List<CategoryEntity> products = [];
    products = categoryList(result);

    saveCategoriesData(products, kCategoryBox);

    return products;
  }

  @override
  Future<List<ProductEntity>> fetchFeatureProduct([int pageNumber=0]) async {
    var result = await apiServer.get("products/?offset=0&limit=10");
    List<ProductEntity> products = [];
    products = productList(result);
    saveProductsData(products, kProductBox);

    return products;
  }

  List<ProductEntity> productList(result) {
    List<ProductEntity> productList = [];
    for (var product in result) {
      productList.add(ProductModel.fromJson(product));
    }

    return productList;
  }

  List<CategoryEntity> categoryList(result) {
    List<CategoryEntity> productList = [];
    for (var product in result) {
      productList.add(Category.fromJson(product));
    }

    return productList;
  }
}
