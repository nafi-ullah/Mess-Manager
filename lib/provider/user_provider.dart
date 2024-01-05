
import 'package:flutter/material.dart';
import 'package:mess_app/models/auth_model.dart';

class UserProvider extends ChangeNotifier{
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      messid: '',
      token: ''
  );

  User get user => _user; // karon eta private variable

  void setUser(String user){   // provider a save hoise log in data
    // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
    _user = User.fromJson(user);
    notifyListeners();
  }

}