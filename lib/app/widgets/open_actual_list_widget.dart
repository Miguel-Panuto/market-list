import 'package:flutter/material.dart';
import 'package:market_list/app/utils/app_routes.dart';

class OpenActualListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.list),
      onPressed: () {
        Navigator.of(context).pushNamed(
          AppRoutes.MANAGE_LIST,
        );
      },
    );
  }
}