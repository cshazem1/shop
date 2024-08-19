import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop/core/error/failure.dart';
import 'package:shop/feature/home/data/data_source/home_local_data_source.dart';
import 'package:shop/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';
import 'package:shop/feature/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({required this.homeLocalDataSource,required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      List<CategoryEntity>categories;
        categories=  homeLocalDataSource.fetchFeatureCategory();
        if(categories.isNotEmpty) {
         return right(categories);
        }

      categories=await homeRemoteDataSource.fetchFeatureCategory();
      return right(categories);
    } on Exception catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }


    }
  }




  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProduct() async {
    try {
      List<ProductEntity>products;
      products=  homeLocalDataSource.fetchFeatureProduct();
      if(products.isNotEmpty) {
        return right(products);
      }
      products=await homeRemoteDataSource.fetchFeatureProduct();
      return right(products);
    } on Exception catch (e) {
      if(e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      else {
        return left(ServerFailure(e.toString()));
      }


    }
  }




}