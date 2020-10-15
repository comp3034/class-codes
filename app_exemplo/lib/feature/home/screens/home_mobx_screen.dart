import 'package:flutter/material.dart';

import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

import 'package:app_exemplo/domain/controllers/friends_controller_mobx.dart';
import 'package:app_exemplo/domain/models/models.dart';
import 'package:app_exemplo/feature/message/screens/message_screen.dart';
import 'package:app_exemplo/utils/app_colors.dart';
import 'package:app_exemplo/utils/arguments/message_screen_arguments.dart';
import 'package:app_exemplo/utils/components/friends_avatar.dart';
import 'package:app_exemplo/utils/components/search.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Faker faker = Faker();
  List lastMessages;
  List<Friend> friends = List<Friend>();
  var format = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    print('HomeScreen MobX');
    FriendsController controller = FriendsController();

    return Scaffold(
      body: FutureBuilder(
        future: controller.fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            'Chat',
                            style: TextStyle(
                              fontSize: 48,
                              fontFamily: 'Rubik',
                              color: AppColors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      Search(),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: controller.friends.isNotEmpty,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .15,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.friends.length,
                            itemBuilder: (context, index) {
                              Friend p = controller.friends[index];
                              return FriendsAvatar(
                                person: p,
                              );
                            },
                          ),
                        ),
                        replacement: Text('Forever alone...'),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Recentes',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Rubik',
                              color: AppColors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: controller.friends.isNotEmpty,
                        child: Expanded(
                          child: Container(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.friends.length,
                              itemBuilder: (context, index) {
                                Friend friend = controller.friends[index];
                                Message lastMessage = friend.messages.last;
                                List<Message> messages = friend.messages;
                                // print(message);
                                return ListTile(
                                  onTap: () => Navigator.of(context).pushNamed(
                                    MessageScreen.routeName,
                                    arguments: MessageScreenArguments(
                                        friend, messages),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 4),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(friend.avatar),
                                  ),
                                  title: Text(
                                    friend.name,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blue[700],
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${lastMessage.body}',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'Rubik',
                                    ),
                                  ),
                                  trailing: Column(
                                    children: <Widget>[
                                      Text(
                                        '${format.format(lastMessage.sendedAt)}',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Rubik',
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        replacement: Text('Não há novas mensagens...'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
