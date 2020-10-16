import 'package:app_exemplo/services/datasources/http/users_datasource_http.dart';
import 'package:app_exemplo/services/datasources/users_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {
  http.Client client = http.Client();

  getIt.registerLazySingleton(() => client);

  getIt.registerLazySingleton<UsersDatasource>(
    () => UsersDatasourceHttp(client: getIt()),
  );
}
