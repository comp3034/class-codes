import 'package:app_exemplo/domain/controllers/controllers.dart';
import 'package:app_exemplo/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/models.dart';
import '../app_colors.dart';

class FriendsAvatar extends StatelessWidget {
  final Friend person;

  const FriendsAvatar({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<FriendsController>(context, listen: false)
            .selectFriend(person);
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      },
      child: Padding(
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
      ),
    );
  }
}
