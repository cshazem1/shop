import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/catogory_cubit/category_cubit.dart';
import 'categories.dart';
import 'category_shimmer.dart';

class CategoriesBlocConsumer extends StatelessWidget {
  const CategoriesBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategorySuccess) {
          return   Categories(state.category);
        } else if (state is CategoryFailure) {
          return Text(state.error);
        } else {
          return const CategoryShimmer();
        }
      },
    );
  }
}

