import 'package:dartz/dartz.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import 'package:shop/models/Product.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity/product_entity.dart';

abstract class HomeRepo{


Future<Either<Failure,List<ProductEntity>>>fetchProduct();
Future<Either<Failure,List<CategoryEntity>>>fetchCategories();

}