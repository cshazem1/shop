part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductFailure extends ProductState {
  String error;

  ProductFailure({required this.error});

}
final class ProductSuccess extends ProductState {

  List<ProductEntity> product;
  ProductSuccess({required this.product});

}
