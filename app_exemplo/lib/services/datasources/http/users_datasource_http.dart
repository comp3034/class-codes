import 'dart:convert';

import 'package:app_exemplo/domain/models/friend.dart';
import 'package:get/get.dart';

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
      var friendsResponse = jsonDecode(response.body);
      RxList<Friend> friends = RxList<Friend>();
      for (var friend in friendsResponse) {
        friends.add(Friend.fromJson(friend));
      }
      return friends;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
