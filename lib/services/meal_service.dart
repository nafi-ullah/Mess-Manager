import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/constants/error_handling.dart';
import 'package:mess_app/models/auth_model.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/router.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices{

  void pushMeal({
    required BuildContext context,
    required String name,
    required String messid,
    required String lunchMeal,
    required int lunchCount,
    required String lunchComment,
  }) async {
    try{
      MembersMeal membersMeal = MembersMeal(
          id: '',
          name: name,
          messid: messid,
          lunchMeal: lunchMeal,
          lunchCount: lunchCount,
          dinnerMeal: '',
          dinnerCount: 0,
          lunchComment: lunchComment,
          dinnerComment: '',
          date: '');


      http.Response res=  await http.post(Uri.parse('$uri/api/mealInfo'),
          body: membersMeal.toJson(),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          }
      );
      print("Sign up info");
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
              content: Text("Try again with right information" )));


    }
  }

  


}