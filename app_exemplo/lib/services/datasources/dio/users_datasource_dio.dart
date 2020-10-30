import 'package:app_exemplo/domain/models/friend.dart';
import 'package:app_exemplo/services/datasources/users_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UsersDatasourceDio extends UsersDatasource {
  Dio client;

  UsersDatasourceDio({this.client});

  @override
  Future<List<Friend>> fetch() async {
    String url = 'https://jsonplaceholder.typicode.com/users/';
    Response response;
    try {
      response = await client.get(url);
      RxList<Friend> friends = RxList<Friend>();
      for (var friend in response.data as List) {
        friends.add(Friend.fromJson(friend));
      }
      return friends;
    } catch (e) {
      throw e;
    }
  }
}
