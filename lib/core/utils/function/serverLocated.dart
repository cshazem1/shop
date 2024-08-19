import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop/feature/home/data/repo/home_repo_impl.dart';
import 'package:shop/feature/home/domain/repositories/home_repo.dart';

import '../../../feature/home/data/data_source/home_local_data_source.dart';
import '../../../feature/home/data/data_source/home_remote_data_source.dart';
import '../api_server.dart';

final getIt = GetIt.instance;

void locatedServerSetup() {
  getIt.registerSingleton<ApiServer>(ApiServer(dio: Dio()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
          apiServer: getIt.get<ApiServer>())));

// Alternatively you could write it if you don't like global variables
}