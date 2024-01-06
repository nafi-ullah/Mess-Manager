import 'package:flutter/material.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/MealType.dart';
import 'package:mess_app/widgets/counter.dart';
import 'package:get/get.dart';


class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

void mealUpdate(){
        Get.defaultDialog(
          title: "Are confirming your meal?",
          content: Container(),
          textConfirm: "Confirm",
          textCancel: "Cancel",
          onConfirm: (){

          },
          onCancel: (){

        }
        );
}

class _FeedState extends State<Feed> {
  String messName = "Danger Zone";
  bool isDay = true;
  String mealTime = "Lunch";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(messName, style: const TextStyle(
              fontSize: 30
            ),)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 300,
          height: 120,
          color: Colors.white54,
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: 300,
          height: 5,
          color: Colors.white54,
        ),
        SizedBox(
          height: 15,
        ),
        MealType(meal: mealTime,),



      ],
    );
  }
}
