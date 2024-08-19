import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failure.dart';
import 'package:shop/core/use_cases/use_case.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import 'package:shop/feature/home/domain/repositories/home_repo.dart';

class FetchCategoryUseCase extends UseCase<List<CategoryEntity>,int>{
final  HomeRepo homeRepo;
  FetchCategoryUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<CategoryEntity>>> call([int? param]) {
    return homeRepo.fetchCategories();
  }



}