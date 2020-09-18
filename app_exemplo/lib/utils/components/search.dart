import 'package:flutter/material.dart';

import '../app_colors.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
