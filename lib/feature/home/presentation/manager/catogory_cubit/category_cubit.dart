import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/feature/home/data/models/categories_model/category.dart';
import 'package:shop/feature/home/domain/use_cases/fetch_product_use_case.dart';

import '../../../domain/entities/category_entity/category_entity.dart';
import '../../../domain/use_cases/fetch_category_use_case.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final FetchCategoryUseCase fetchCategoryUseCase;
  CategoryCubit({required this.fetchCategoryUseCase}) : super(CategoryInitial());
  Future<void> fetchProduct() async {
    emit(CategoryLoading());
    var result= await fetchCategoryUseCase.call();
    result.fold((failure) {
      emit(CategoryFailure(error: failure.message));
    }, (product) {
      emit(CategorySuccess(category: product));
    },);
  }

}
