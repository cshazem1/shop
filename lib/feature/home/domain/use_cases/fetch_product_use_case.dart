import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failure.dart';
import 'package:shop/core/use_cases/use_case.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';
import 'package:shop/feature/home/domain/repositories/home_repo.dart';

class FetchProductUseCase extends UseCase<List<ProductEntity>,int>{
final  HomeRepo homeRepo;
  FetchProductUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<ProductEntity>>> call([int? param]) {
return  homeRepo.fetchProduct();

  }




}