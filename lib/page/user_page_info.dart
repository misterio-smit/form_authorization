import 'package:flutter/material.dart';
import 'package:flutter_form_authorization/model/user.dart';
import 'package:flutter_form_authorization/page/form_authorization.dart';

class UserPageInfo extends StatelessWidget {
  User userInfo;
  UserPageInfo({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          child: const Align(
              child: Text('Welcome',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        ),
      );
    }

    Widget _form() {
      return Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Email :${userInfo.email}',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ),
            ListTile(
              title: Text('Password :${userInfo.password}',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Center(child: Text('Flatter logo demo')),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Logout'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _logo(),
          const SizedBox(
            height: 30,
          ),
          _form(),
        ],
      ),
    );
  }
}
