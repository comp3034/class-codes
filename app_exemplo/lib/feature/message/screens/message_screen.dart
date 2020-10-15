import 'package:app_exemplo/domain/models/friend.dart';
import 'package:app_exemplo/domain/models/models.dart';
import 'package:app_exemplo/utils/arguments/message_screen_arguments.dart';
import 'package:app_exemplo/utils/components/friends_avatar.dart';
import 'package:app_exemplo/utils/components/search.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class MessageScreen extends StatefulWidget {
  static const routeName = '/messages';

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Friend friend;
  List messages = List();

  @override
  Widget build(BuildContext context) {
    final MessageScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    print(args);
    friend = args.friend;
    messages = args.messages;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            buildTop(),
            Search(),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  Message message = messages[index];
                  return ChatBubble(
                    clipper: ChatBubbleClipper1(
                      type: message.isOrigin
                          ? BubbleType.sendBubble
                          : BubbleType.receiverBubble,
                    ),
                    alignment: message.isOrigin
                        ? Alignment.topRight
                        : Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 20),
                    backGroundColor:
                        message.wasRead ? Colors.blue : Colors.amber,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        '${message.body}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTop() => Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(friend.avatar),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text('${friend.name}'),
                    )
                  ],
                ),
                Text(
                  'busy',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      );
}
