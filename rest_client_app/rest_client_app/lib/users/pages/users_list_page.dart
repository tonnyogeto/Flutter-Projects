import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_client_app/users/cards/user_card.dart';
import 'package:http/http.dart' as http;
import 'package:rest_client_app/users/models/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> _userList = <User>[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text("Fetch User"),
          onPressed: () async {
            _fetchUsers(context);
          },
        ),
        SizedBox(
          height: 500,
          child: ListView(
              children: _userList.map((user) => UserCard(user: user)).toList()),
        ),
      ],
    );
  }

  void _fetchUsers(BuildContext context) async {
    var fetchUrl = Uri.http("192.168.0.107:8080", "/api/users");
    var response = await http.get(fetchUrl);
    Map<String, dynamic> responseJson = json.decode(response.body);
    String message = responseJson['message'];
    if (response.statusCode != 200) {
      showAlertDialog(context, message);
    }
    List<dynamic> users = responseJson['content'];

    setState(() {
      _userList = List<User>.from(users.map((e) => User.fromJson(e)));
    });
  }

  void showAlertDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context, false);
           setState(() {
      _userList =[];
    });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
