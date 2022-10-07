import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routers/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {

  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
      ? const CircleAvatar(child: Icon(Icons.person),)
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl),);
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(icon: Icon(Icons.edit), color: Colors.orange, onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.USER_FORM,
            arguments: user,);
          }),
          IconButton(icon: Icon(Icons.delete), color: Colors.red, onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Usuário'),
                  content: Text('Tem certeza?'),
                  actions: <Widget>[
                    MaterialButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    MaterialButton(
                      child: Text('Sim'),
                      onPressed: () {
                        Provider.of<Users>(context, listen: false).remove(user);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )
            );
          })
        ],
        ),
      )
    );
  }
}