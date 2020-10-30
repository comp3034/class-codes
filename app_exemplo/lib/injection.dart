import 'package:app_exemplo/services/datasources/http/users_datasource_http.dart';
import 'package:app_exemplo/services/datasources/users_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'services/datasources/dio/users_datasource_dio.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  http.Client client = http.Client();
  Dio dioClient = Dio();

  getIt.registerLazySingleton(() => client);

  getIt.registerLazySingleton(() => dioClient);

  getIt.registerLazySingleton<UsersDatasource>(
    () => UsersDatasourceDio(client: getIt()),
  );
}
