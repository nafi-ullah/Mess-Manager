import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/constants/error_handling.dart';
import 'package:mess_app/models/bazarModel.dart';

import 'package:mess_app/provider/user_provider.dart';
import 'package:provider/provider.dart';


class BazarService{

  void pushBazar({
    required BuildContext context,
    required List<String> bazar,
    required List<String> quantity,
    required List<int> cost,
  }) async {
    try{
      final user = Provider.of<UserProvider>(context, listen: false).user;

     BazarModel bazarModel =  BazarModel(
          name: user.name,
          messid: user.messid,
          date: " ",
          bazar: bazar,
          quantity: quantity,
          cost: cost);

      // MealModel membersMeal = MealModel(
      //     id: '',
      //     name: user.name,
      //     messid: user.messid,
      //     mealMenu: mealMenu,
      //     count: count,
      //     comment: comment);


      http.Response res=  await http.post(Uri.parse('$uri/api/bazarInfo'),
          body: bazarModel.toJson(),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          }
      );

      print(res.body);



      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            //print("Bazar updated");
            showSnackBar(context, 'Your bazar has listed');
          }
      );


    }catch(e){
      print(e.toString());
      //showSnackBar(context, e.toString());


    }
  }
// fetch products
  Future<List<BazarModel>> fetchAllMeals(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    String passMessId = userProvider.messid;
    List<BazarModel> bazarList = [];
    try {
      http.Response res =
      await http.get(Uri.parse('$uri/api/allBazar?messid=${passMessId}'),

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
            bazarList.add(
              BazarModel.fromJson(
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
    return bazarList;
  }
// fetching meal data of all months


}