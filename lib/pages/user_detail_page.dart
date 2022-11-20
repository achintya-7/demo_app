import 'package:demo_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.userModel});
  final UserModel userModel;

  Future _launchUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${userModel.id} : ${userModel.name}"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              userModel.name,
              style: TextStyle(
                  color: Colors.amber[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userModel.username,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _launchUrl(
                      "mailto:${userModel.email}?subject=Hello ${userModel.name}&body=<p> Hi ${userModel.name}, <br> <br> How are you? <br> <br> Regards, <br> Sundar </p>");
                },
                child: const Text("Open Email")),
          ],
        ),
      ),
    );
  }
}
