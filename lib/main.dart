import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/core/utils/api_server.dart';
import 'package:shop/core/utils/function/serverLocated.dart';
import 'package:shop/core/utils/router.dart';
import 'package:shop/feature/home/data/data_source/home_local_data_source.dart';
import 'package:shop/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:shop/feature/home/data/repo/home_repo_impl.dart';
import 'package:shop/feature/home/domain/entities/category_entity/category_entity.dart';
import 'package:shop/feature/home/domain/entities/product_entity/product_entity.dart';
import 'package:shop/feature/home/domain/repositories/home_repo.dart';
import 'package:shop/feature/home/domain/use_cases/fetch_product_use_case.dart';
import 'package:shop/feature/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:shop/feature/home/presentation/views/home_view/home_screen.dart';

import 'constants.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  locatedServerSetup();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  await Hive.openBox<CategoryEntity>(kCategoryBox);
  await Hive.openBox<ProductEntity>(kProductBox);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),

    );
  }
}
