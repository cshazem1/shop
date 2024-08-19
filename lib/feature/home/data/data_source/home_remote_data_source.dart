import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:shop/core/utils/api_server.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';

abstract class HomeRemoteDataSource {

 Future<List<ProductEntity>> fetchFeatureProduct();
 Future<List<ProductEntity>> fetchFeatureCategory();

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiServer apiServer;
   HomeRemoteDataSourceImpl({required this.apiServer});
  @override
  Future<List<ProductEntity>> fetchFeatureCategory() async {
var result= await apiServer.get("categories/");
List<ProductEntity>products=[];
products=productList(result);

return products;


  }





  @override
  Future<List<ProductEntity>> fetchFeatureProduct() async {
    var result= await apiServer.get("products/");
    List<ProductEntity>products=[];
    products=productList(result);

    return products;
  }


  List<ProductEntity> productList(result) {
    List<ProductEntity>productList=[];
    for(var product in result)
    {

      productList.add(ProductModel.fromJson(product));



    }
    return productList;
  }


}