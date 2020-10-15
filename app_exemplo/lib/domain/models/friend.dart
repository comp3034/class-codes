import 'package:app_exemplo/domain/models/message.dart';

class Friend {
  String name;
  String avatar;
  int age;
  String city;
  bool status;
  List<Message> messages;

  Friend({
    this.name,
    this.avatar,
    this.messages,
    this.age,
    this.city,
    this.status = false,
  });
}
