import 'package:flutter/material.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/widgets/EveryoneMeal.dart';
import 'package:mess_app/widgets/mealstate.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:provider/provider.dart';

import '../models/members.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({super.key});
  static const String routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mealTime='Lunch: ';
  String selectedItem = 'off';
  final String userId = 'user1';

  String dropdownvalue = 'Item 1';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {

    Meal user = membersInfo.firstWhere((userp) => userp.userId == userId, );

    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hellloooo")
          // DropdownButton(
          //
          //   // Initial Value
          //   value: dropdownvalue,
          //
          //   // Down Arrow Icon
          //   icon: const Icon(Icons.keyboard_arrow_down),
          //
          //   // Array list of items
          //   items: mealCategory.map((String items) {
          //     return DropdownMenuItem(
          //       value: items,
          //       child: Text(items),
          //     );
          //   }).toList(),
          //   // After selecting the desired option,it will
          //   // change button value to selected value
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       dropdownvalue = newValue!;
          //     });
          //   },
          // ),
        ],
      ),
    );

  }
}
