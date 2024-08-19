part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategoryFailure extends CategoryState {
  String error;

  CategoryFailure({required this.error});

}
final class CategorySuccess extends CategoryState {

  List<CategoryEntity> category;
  CategorySuccess({required this.category});

}
