import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/constants/error_handling.dart';
import 'package:mess_app/models/auth_model.dart';

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

    }
  }


}