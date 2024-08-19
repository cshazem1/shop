import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/domain/repositories/home_repo.dart';
import '../../feature/home/domain/use_cases/fetch_product_use_case.dart';
import '../../feature/home/presentation/manager/product_cubit/product_cubit.dart';
import '../../feature/home/presentation/views/home_screen.dart';
import 'function/serverLocated.dart';

class AppRouter {
  static final router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                  ProductCubit(
                      fetchProductUseCase: FetchProductUseCase(
                          homeRepo: getIt.get<HomeRepo>()))
                    ..fetchProduct()
                  ,
                ),

              ],
              child: const HomeScreen(),
            );
          },

        )
      ]);


}