import 'package:dartz/dartz.dart';
import 'package:shop/core/error/failure.dart';

abstract class UseCase<Type,Param>{

  Future<Either<Failure,Type>> call([Param?param]);


}