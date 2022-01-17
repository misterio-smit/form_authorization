import 'package:flutter/material.dart';
import 'package:flutter_form_authorization/page/form_authorization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageAuthorization(),
    );
  }
}
