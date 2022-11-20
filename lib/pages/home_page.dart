// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:demo_app/models/user_model.dart';
import 'package:demo_app/pages/user_detail_page.dart';
import 'package:demo_app/services/http_service.dart';
import 'package:demo_app/widgets/sundar_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<UserModel>> getUsers() async {
    var response = await HttpService.getResposne(
        'https://jsonplaceholder.typicode.com/users');
    if (response == null) {
      Fluttertoast.showToast(msg: "Unable to retrieve users");
    }

    var jsonData = jsonDecode(response);
    var data =
        jsonData.map<UserModel>((user) => UserModel.fromMap(user)).toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<UserModel> users = snapshot.data;

              if (users.isEmpty) {
                return const Center(
                  child: Text('No users found'),
                );
              }

              return ListView.builder(
                itemCount: users.length * 10,
                itemBuilder: (BuildContext context, int index) {
                  return SundarWidget(
                    widget: ListTile(
                      title: Text(users[index % users.length].name),
                      subtitle: Text(users[index % users.length].email),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => UserDetailsPage(
                                  userModel: users[index % users.length],
                                )));
                      },
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
