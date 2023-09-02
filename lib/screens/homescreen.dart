import 'package:flutter/material.dart';
import 'package:mess_app/widgets/mealstate.dart';
import 'package:mess_app/dummydata/memberdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final itemCounting = membersInfo.length; // Replace with your actual number of items
    final itemWidth = MediaQuery.of(context).size.width / itemCounting;


    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCounting,
      itemExtent: itemWidth,
      itemBuilder: (ctx, index)=> MealState(
        userName: membersInfo[index].memberName,
        mealActivity: membersInfo[index].lunchActivity.toString(),
        mealCount: membersInfo[index].lunchCount),
    );
  }
}
