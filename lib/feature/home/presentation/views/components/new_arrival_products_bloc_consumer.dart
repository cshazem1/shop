import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/product_cubit/product_cubit.dart';
import 'new_arrival_products.dart';

class NewArrivalProductsBlocConsumer extends StatelessWidget {
  const NewArrivalProductsBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state is ProductSuccess)
        {
          return  NewArrivalProducts(state.product.reversed.toList());}
        else if (state is ProductFailure)
        {
          return Text(state.error);

        }
        else
          return const CircularProgressIndicator();
      },
    );
  }
}
