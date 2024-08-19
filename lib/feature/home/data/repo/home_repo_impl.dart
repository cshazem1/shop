import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() {
  List<CategoryEntity>list=  homeLocalDataSource.fetchFeatureCategory();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProduct() {
    // TODO: implement fetchProduct
    throw UnimplementedError();
  }




}