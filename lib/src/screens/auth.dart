import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: use_key_in_widget_constructors
class AuthorizationPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _email;
  String? _password;
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    Widget _button(String text, void Function() func) {
      return ElevatedButton(
        onPressed: () {
          func();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          shape: const StadiumBorder(),
        ),
        // ignore: prefer_const_constructors
        child: Text(
          "Login",
          style: const TextStyle(
              color: Color.fromARGB(255, 95, 94, 95), fontSize: 16),
        ),
      );
    }

    Widget _logo() {
      return Padding(
          padding: const EdgeInsets.only(top: 100),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: const Align(
            child: Text('MyApp',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromRGBO(75, 73, 83, 1)),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                    color: Color.fromRGBO(90, 167, 135, 1), width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide:
                    BorderSide(color: Color.fromRGBO(65, 64, 73, 1), width: 1)),
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon)),
          ),
        ),
      );
    }

    Widget _form(String label, void Function() func) {
      return Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: _input(
                    Icon(Icons.email), 'Email', _emailController, false)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _input(
                  Icon(Icons.lock), 'Password', _passwordController, true),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),
            )
          ],
        ),
      );
    }

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            _logo(),
            _form('LOGIN', _buttonAction),
          ],
        ));
  }
}



// rgb(31,30,40)