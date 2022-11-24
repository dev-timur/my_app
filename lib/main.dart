import 'package:flutter/material.dart';
import 'package:my_app/src/screens/auth.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test App',
        theme: ThemeData(
            primaryColor: const Color.fromRGBO(31, 30, 40, 1),
            textTheme: const TextTheme(
                titleMedium: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)))),
        home: AuthorizationPage());
  }
}
