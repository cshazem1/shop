import 'package:dartz/dartz.dart';
import 'package:shop/models/Product.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

abstract class HomeRepo{


Future<Either<Failure,List<ProductEntity>>>fetchProduct();
Future<Either<Failure,List<ProductEntity>>>fetchCategories();

}