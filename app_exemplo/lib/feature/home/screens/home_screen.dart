import 'package:app_exemplo/utils/app_colors.dart';
import 'package:app_exemplo/utils/components/friends_avatar.dart';
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
  // var format = DateFormat.Hm();

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
          child: Column(
            children: [
              Text(
                'Chat',
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.blue[700],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search...',
                  labelStyle: TextStyle(
                    color: AppColors.blue[800],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.blue[800],
                    ),
                    onPressed: null,
                  ),
                ),
              ),
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
              Text(
                'Recentes',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.blue[700],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: lastMessages.length,
                    itemBuilder: (context, index) {
                      var message = lastMessages[index];

                      print(message);
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(message['person']['avatar']),
                          ),
                          title: Text(
                            'Nome',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.blue[700],
                            ),
                          ),
                          subtitle: Text('${message['message']}'),
                          trailing: Text(
                            '18:00',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
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
    );
  }
}
