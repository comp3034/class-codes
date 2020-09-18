import 'package:flutter/material.dart';

import '../app_colors.dart';

class FriendsAvatar extends StatelessWidget {
  final Friend person;

  const FriendsAvatar({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(person.avatar),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${person.name}',
              style: TextStyle(
                fontSize: 9,
                fontFamily: 'Rubik',
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Friend {
  String name;
  String avatar;

  Friend({this.name, this.avatar});
}
