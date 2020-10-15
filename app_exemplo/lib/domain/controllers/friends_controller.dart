import 'dart:collection';
import 'dart:async';

import 'package:app_exemplo/domain/models/models.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class FriendsController extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Friend> _friends = [];
  Friend _selectedFriend;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Friend> get friends => UnmodifiableListView(_friends);

  Friend get friend => _selectedFriend;

  selectFriend(Friend friend) {
    _selectedFriend = friend;
    notifyListeners();
  }

  Future<void> fetch() async {
    mockData();
    await Future.delayed(Duration(seconds: 4));
  }

  void mockData() {
    final Faker faker = Faker();
    DateTime now = DateTime.now();

    _friends.add(
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
    _friends.add(
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
    _friends.add(
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
