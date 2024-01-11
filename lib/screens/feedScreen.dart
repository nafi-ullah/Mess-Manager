import 'package:flutter/material.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/services/meal_service.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/MealType.dart';
import 'package:mess_app/widgets/mealstate.dart';
import 'package:provider/provider.dart';


class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}



class _FeedState extends State<Feed> {
  String messName = "Danger Zone";
  bool isDay = true;
  String mealTime = "Lunch";
  List<MembersMeal>? meals;
  final MealService mealService = MealService();

  fetchAllMeals() async {
    meals = await mealService.fetchAllMeals(context);
    print(meals?[0].name);
   // print("haiyoooooooooooooooooooooooooooooooooooooooooo");
    setState(() {

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllMeals();
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    Widget content = ListView.builder(
        itemCount: meals!.length,
        itemBuilder: (ctx, index) => MealState(
            userName: meals![index].name,
            mealActivity: meals![index].lunchMeal,
            mealCount: meals![index].lunchCount
        )

    );

    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to " + messName, style: const TextStyle(
              fontSize: 18
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
        SizedBox(
            height: 40,
            width: 200,
            child: ButtonWidget(textSize: 15,
                btnText: "Wanna Update", onPress:(){
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context){
                        return MealType(context: context, meal: mealTime,);
                      }
                  );
                })
        ),




      ],
    );
  }
}
