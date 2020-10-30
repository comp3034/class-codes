import 'package:app_exemplo/domain/controllers/controllers.dart';
import 'package:app_exemplo/domain/models/models.dart';
import 'package:app_exemplo/utils/app_colors.dart';
import 'package:app_exemplo/utils/components/friends_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Stack(
                  children: [
                    ProfileTop(),
                    Positioned(
                      top: 10,
                      left: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.blue[700],
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              FriendsContainer(),
              SizedBox(height: 8),
              GroupsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTop extends StatelessWidget {
  final FriendsController controller = Get.put(FriendsController());

  Map<dynamic, Widget> options = {
    0: Text('posts'),
    1: Text('info'),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 12.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(controller.friend.avatar),
              radius: 42,
            ),
          ),
          Text('${controller.friend.name}', style: TextStyle(fontSize: 28)),
          Text('${controller.friend.age} years, ${controller.friend.city}'),
          Text('last seen just now'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 46,
                      child: OutlineButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: null,
                        child: Icon(Icons.person_add),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      'Follow',
                      style: TextStyle(fontSize: 9),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 46,
                      child: OutlineButton(
                        padding: EdgeInsets.all(0),
                        onPressed: null,
                        child: Icon(Icons.notifications_none),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      'Get notified',
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 46,
                      child: OutlineButton(
                        padding: EdgeInsets.all(0),
                        onPressed: null,
                        child: Icon(Icons.message),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      'Message',
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 46,
                      child: OutlineButton(
                        padding: EdgeInsets.all(0),
                        onPressed: null,
                        child: Icon(Icons.more_horiz),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      'More',
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // CupertinoSegmentedControl(
          //   children: options,
          //   onValueChanged: (value) => options[value],
          //   borderColor: AppColors.blue[700],
          //   padding: const EdgeInsets.symmetric(vertical: 4),
          //   selectedColor: AppColors.blue[700],
          //   unselectedColor: Colors.white,
          //   pressedColor: AppColors.blue[700],
          // ),
        ],
      ),
    );
  }
}

class FriendsContainer extends StatelessWidget {
  List<Friend> friends = List<Friend>();

  @override
  Widget build(BuildContext context) {
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

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .2,
      child: Column(
        children: [
          Text('Amigos'),
          Expanded(
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
        ],
      ),
    );
  }
}

class GroupsContainer extends StatelessWidget {
  List<Friend> friends = List<Friend>();

  @override
  Widget build(BuildContext context) {
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

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        children: [
          Text('Grupos'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: friends.length,
              itemBuilder: (context, index) {
                Friend p = friends[index];
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(p.avatar),
                        ),
                      ),
                      Column(
                        children: [
                          Text('${p.name}'),
                          Text(
                            '1 common friend',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            minWidth: 16,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            color: AppColors.blue,
                            onPressed: () {},
                            child: Icon(
                              Icons.plus_one,
                              color: Colors.white,
                            ),
                          ),
                          MaterialButton(
                            minWidth: 18,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            color: Colors.grey[200],
                            onPressed: () {},
                            child: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
