import 'package:app_exemplo/utils/components/friends_avatar.dart';
import 'package:app_exemplo/utils/components/search.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Friend friend;
  List messages = List();

  @override
  void initState() {
    Faker faker = Faker();
    friend = Friend(
      name: 'John',
      avatar: 'https://www.placecage.com/64/64',
    );
    messages.add({'message': faker.lorem.sentence(), 'origin': true});
    messages.add({'message': faker.lorem.sentence(), 'origin': false});
    messages.add({'message': faker.lorem.sentence(), 'origin': true});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(friend.avatar),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 6,
                        ),
                        Text('${friend.name}')
                      ],
                    ),
                    Text('busy')
                  ],
                ),
              ],
            ),
            Search(),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  var message = messages[index];
                  return ChatBubble(
                    clipper: ChatBubbleClipper1(
                        type: message['origin']
                            ? BubbleType.sendBubble
                            : BubbleType.receiverBubble),
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 20),
                    backGroundColor: Colors.blue,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Text(
                        '${message['message']}',
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
}
