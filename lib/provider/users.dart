import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/dummy_users.dart';

import '../models/user.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  // adiciona ou altera se já existir
  void put(User user) {
    // if(user.id == null || user.id!.trim().isEmpty) {
    //   return;
    // }

    if (_items.containsKey(user.id)) {
      _items.update(user.id!, (_) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ),);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ),);
    }

    // notifica as classes que escutam essa classe:
    notifyListeners();
  }


  void remove(User user) {
    if(user == null || user.id!.trim().isEmpty) {
      return;
    } else {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}