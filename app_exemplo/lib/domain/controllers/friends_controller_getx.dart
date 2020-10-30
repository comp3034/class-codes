import 'dart:async';

import 'package:app_exemplo/domain/models/models.dart';
import 'package:app_exemplo/services/datasources/users_datasource.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class FriendsController extends GetxController {
  UsersDatasource datasource = GetIt.I.get<UsersDatasource>();

  var friends = RxList<Friend>();
  var isLoading = RxBool(false);
  var selectedFriend = Friend().obs;

  toogleLoading() => isLoading.value = !isLoading.value;

  Friend get friend => selectedFriend.value;

  Future<void> fetch() async {
    toogleLoading();
    try {
      friends = await datasource.fetch();
    } catch (e) {
      print(e);
    }
    toogleLoading();
  }

  void mockData() {
    final Faker faker = Faker();
    DateTime now = DateTime.now();

    friends.add(
      Friend(
        name: 'abott',
        avatar: 'https://api.adorable.io/avatars/64/abott@adorable.png',
        age: 32,
        city: 'Londrina',
        messages: [
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(minutes: 10))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(minutes: 8))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(minutes: 5))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(minutes: 5))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(minutes: 3))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(minutes: 3))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(minutes: 2))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(minutes: 1))),
          Message(body: faker.lorem.sentence(), isOrigin: true, sendedAt: now),
        ],
      ),
    );
    friends.add(
      Friend(
        name: 'john',
        avatar: 'https://api.adorable.io/avatars/64/john@adorable.io.png',
        age: 21,
        status: faker.randomGenerator.boolean(),
        city: faker.address.city(),
        messages: [
          Message(
            body: faker.lorem.sentence(),
            sendedAt: now.subtract(Duration(minutes: 10)),
          ),
          Message(
            body: faker.lorem.sentence(),
            isOrigin: true,
            sendedAt: now.subtract(Duration(minutes: 8)),
          ),
          Message(
            body: faker.lorem.sentence(),
            sendedAt: now.subtract(Duration(minutes: 5)),
          ),
          Message(
            body: faker.lorem.sentence(),
            sendedAt: now.subtract(Duration(minutes: 5)),
          ),
          Message(
            body: faker.lorem.sentence(),
            isOrigin: true,
            sendedAt: now.subtract(Duration(minutes: 3)),
          ),
          Message(
            body: faker.lorem.sentence(),
            isOrigin: true,
            sendedAt: now.subtract(Duration(minutes: 3)),
          ),
          Message(
            body: faker.lorem.sentence(),
            sendedAt: now.subtract(Duration(minutes: 2)),
          ),
          Message(
            body: faker.lorem.sentence(),
            sendedAt: now.subtract(Duration(minutes: 1)),
          ),
          Message(body: faker.lorem.sentence(), isOrigin: true, sendedAt: now),
        ],
      ),
    );
    friends.add(
      Friend(
        name: 'dude',
        avatar: 'https://api.adorable.io/avatars/64/dude@adorable.io.png',
        age: 24,
        status: faker.randomGenerator.boolean(),
        city: faker.address.city(),
        messages: [
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(days: 1))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(days: 1))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(hours: 8))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(hours: 5))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(hours: 5))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(hours: 1))),
          Message(
              body: faker.lorem.sentence(),
              isOrigin: true,
              sendedAt: now.subtract(Duration(hours: 1))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(hours: 1))),
          Message(
              body: faker.lorem.sentence(),
              sendedAt: now.subtract(Duration(hours: 1))),
        ],
      ),
    );
  }
}
