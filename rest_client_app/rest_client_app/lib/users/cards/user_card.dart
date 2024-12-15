// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rest_client_app/users/models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Card(
        child: Column(
          children:  [
            Row(
              children: [
                Text("Name: "),
                Text(user.name),
              ],
            ),
            Row(
              children: [
                Text("Id Number: "),
                Text(user.idNumber),
              ],
            )
          ],
        ),
      ),
    );
  }
}
