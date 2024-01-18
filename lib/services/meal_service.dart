import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/constants/error_handling.dart';
import 'package:mess_app/models/auth_model.dart';
import 'package:mess_app/models/mealModel.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/router.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealService{

  void pushMeal({
    required BuildContext context,
    required String mealMenu,
    required int count,
    required String comment,
  }) async {
    try{
      final user = Provider.of<UserProvider>(context, listen: false).user;

      MealModel membersMeal = MealModel(
          id: '',
          name: user.name,
          messid: user.messid,
          mealMenu: mealMenu,
          count: count,
          comment: comment);


      http.Response res=  await http.patch(Uri.parse('$uri/api/updateInfo'),
          body: membersMeal.toJson(),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          }
      );
      //print("Sign up info");
      print(res.body);



      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            print("Meal updated");
              showSnackBar(context, 'Your meal is updated');
          }
      );


    }catch(e){
      print(e.toString());
      //showSnackBar(context, e.toString());


    }
  }
// fetch products
  Future<List<MembersMeal>> fetchAllMeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    String passMessId = userProvider.messid;
    List<MembersMeal> mealsList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/get-meals?messid=${passMessId}'),

          headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'x-auth-token': userProvider.user.token,
      },


      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            mealsList.add(
              MembersMeal.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e);
      //showSnackBar(context, e.toString());
    }
    return mealsList;
  }
// fetching meal data of all months
  Future<List<MembersMeal>> fetchMontlyMeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    String passMessId = userProvider.messid;
    List<MembersMeal> mealsList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/month-meals?messid=${passMessId}&monthYear=2024-01'),

        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          //'x-auth-token': userProvider.user.token,
        },


      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            mealsList.add(
              MembersMeal.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return mealsList;
  }


}