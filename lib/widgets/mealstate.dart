import 'package:flutter/material.dart';
import 'package:mess_app/models/members.dart';

class MealState extends StatelessWidget {
  const MealState(

      {super.key,
      required  this.userName,
       required this.mealActivity,
       required this.mealCount,
      });

  final String userName;
  final String mealActivity;
  final int mealCount;


  @override
  Widget build(BuildContext context) {
  String mealName = mealActivity.toString().split('.').last;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0,16,0,16),
      width: 30, // Adjust the width as needed
      height: 30, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.green, // Set the background color
        borderRadius: BorderRadius.circular(50), // Set the radius to create a round shape
      ),
        ),
        Text(userName),
        Text(mealName),
        Text('Count: $mealCount'),
      ],
    );
  }
}
