import 'package:app_exemplo/utils/app_colors.dart';
import 'package:app_exemplo/utils/components/friends_avatar.dart';
import 'package:app_exemplo/utils/components/search.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Faker faker = Faker();
  List lastMessages;
  List<Friend> friends = List<Friend>();
  var format = DateFormat('HH:mm');

  @override
  void initState() {
    lastMessages = [
      {
        'person': {
          'name': 'abott',
          'avatar': 'https://api.adorable.io/avatars/64/abott@adorable.png',
        },
        'message': faker.lorem.sentence(),
        'created_at': DateTime.now()
      },
      {
        'person': {
          'name': 'john',
          'avatar': 'https://api.adorable.io/avatars/64/john@adorable.io.png',
        },
        'message': faker.lorem.sentence(),
        'created_at': DateTime.now()
      },
      {
        'person': {
          'name': 'dude',
          'avatar': 'https://api.adorable.io/avatars/64/dude@adorable.io.png',
        },
        'message': faker.lorem.sentence(),
        'created_at': DateTime.now()
      }
    ];

    friends.add(
      Friend(
          name: 'abott',
          avatar: 'https://api.adorable.io/avatars/64/abott@adorable.png'),
    );
    friends.add(
      Friend(
          name: 'john',
          avatar: 'https://api.adorable.io/avatars/64/john@adorable.io.png'),
    );
    friends.add(
      Friend(
          name: 'dude',
          avatar: 'https://api.adorable.io/avatars/64/dude@adorable.io.png'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                Container(
                  height: MediaQuery.of(context).size.height * .15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: friends.length,
                    itemBuilder: (context, index) {
                      Friend p = friends[index];
                      return FriendsAvatar(
                        person: p,
                      );
                    },
                  ),
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
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: lastMessages.length,
                      itemBuilder: (context, index) {
                        var message = lastMessages[index];

                        print(message);
                        return ListTile(
                          onTap: () =>
                              Navigator.of(context).pushNamed('message'),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(message['person']['avatar']),
                          ),
                          title: Text(
                            message['person']['name'],
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue[700],
                            ),
                          ),
                          subtitle: Text(
                            '${message['message']}',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Rubik',
                            ),
                          ),
                          trailing: Column(
                            children: <Widget>[
                              Text(
                                '${format.format(message['created_at'])}',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
