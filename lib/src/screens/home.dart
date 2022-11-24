import 'package:flutter/material.dart';
import '../domain/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: UserList(),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final users = <User>[
    User(first_name: 'Timur'),
    User(first_name: 'Timur'),
    User(first_name: 'Timur')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(50, 65, 85, 0.8)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                      title: Text(
                    users[index].first_name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              );
            }),
      ),
    );
  }
}
