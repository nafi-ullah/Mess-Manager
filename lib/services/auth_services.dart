import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/constants/error_handling.dart';
import 'package:mess_app/models/auth_model.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/router.dart';
import 'package:mess_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices{

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String messid,
  }) async {
    try{
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          messid: messid,
          token: ''
      );

      http.Response res=  await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',

          }
      );
      print(res.body);



      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            showSnackBar(context, 'Account created! Log in with same email and password');
          }
      );


    }catch(e){
      print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(e.toString() )));


    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try{

      http.Response res=  await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password
          }),
          headers: <String, String>{
            // "Access-Control-Allow-Origin": "*",
            'Content-Type' : 'application/json; charset=UTF-8',
            // 'Accept': '*/*'
          }
      );


//      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {

            // log in er por token store kore rakhbo jeno barbar log in krte na hoy

            SharedPreferences prefs = await SharedPreferences.getInstance();

            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']); //shared preference a jst token ta thakbe
            Navigator.pushAndRemoveUntil(
                context,
                generateRoute(
                    RouteSettings(name: HomeScreen.routeName)
                ),
                //MaterialPageRoute(builder: (context) => HomeScreen()), same as above
                    (route) => false);
          }
      );
    }catch(e){
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }


}