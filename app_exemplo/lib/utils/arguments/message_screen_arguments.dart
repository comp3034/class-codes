import '../../domain/models/models.dart';

class MessageScreenArguments {
  final Friend friend;
  final List<Message> messages;

  MessageScreenArguments(this.friend, this.messages);
}
