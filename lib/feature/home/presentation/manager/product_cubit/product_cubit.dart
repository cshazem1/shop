import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/use_cases/fetch_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
 final FetchProductUseCase fetchProductUseCase;
  ProductCubit({required this.fetchProductUseCase}) : super(ProductInitial());
  Future<void> fetchProduct() async {
    emit(ProductLoading());
 var result= await fetchProductUseCase.call();
    result.fold((failure) {
      emit(ProductFailure(error: failure.message));
    }, (product) {
      emit(ProductSuccess(product: product));
    },);
  }
}
