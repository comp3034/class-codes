import 'package:app_exemplo/domain/models/friend.dart';

import 'package:http/http.dart' as http;

import '../users_datasource.dart';

class UsersDatasourceHttp extends UsersDatasource {
  http.Client client;

  UsersDatasourceHttp({this.client});

  @override
  Future<List<Friend>> fetch() async {
    String url = 'https://jsonplaceholder.typicode.com/users/';
    try {
      var response = await client.get(url);
      print(response.body);
      return [];
    } catch (e) {
      print(e);
    }
  }
}
