import 'package:flutter/material.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:mess_app/widgets/mealstate.dart';

class EveryOneMeal extends StatelessWidget {
  const EveryOneMeal({super.key});

  @override
  Widget build(BuildContext context) {
    String mealTime='Lunch: ';
    String selctedItem = 'off';
    final String userId = 'user1';
    final itemCounting = membersInfo.length;
    final itemWidth = MediaQuery.of(context).size.width / itemCounting;


    return SizedBox(
      //flex:2,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCounting,
        itemExtent: itemWidth,
        itemBuilder: (ctx, index)=> MealState(
            userName: membersInfo[index].memberName,
            mealActivity: membersInfo[index].lunchActivity.toString(),
            mealCount: membersInfo[index].lunchCount),

      ),
    );
  }
}
