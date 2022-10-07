import 'package:flutter/material.dart';
import 'package:flutter_crud/routers/app_routes.dart';
import 'package:provider/provider.dart';

import '../components/user_tile.dart';
import '../models/user.dart';
import '../provider/users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.add),
            onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM,
                    arguments: const User(
                      name: '',
                      email: '',
                      avatarUrl: '',
                    ));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      )
    );
  }
}