
import 'package:flutter/material.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/services/meal_service.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/MealType.dart';
import 'package:mess_app/widgets/comments.dart';
import 'package:mess_app/widgets/commentshow.dart';
import 'package:mess_app/widgets/loader.dart';
import 'package:mess_app/widgets/mealSummary.dart';
import 'package:mess_app/widgets/mealstate.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


class Feed extends StatefulWidget {
  static const String routeName = '/feed';
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}



class _FeedState extends State<Feed> {

  bool isDay = true;
  String mealTime = "Lunch";
  List<MembersMeal> meals = [];
  int chickenCount = 0;
  int fishCount =0;
  int riceCount = 0;
  final MealService mealService = MealService();

  fetchAllMeals() async {
    meals = await mealService.fetchAllMeals(context);

    for (var user in meals) {
      if (user.lunchMeal == "Chicken") {
        chickenCount = chickenCount + user.lunchCount;
        riceCount = riceCount + user.lunchCount;
        //usernames.add(user['username']);
      }
    }
    for (var user in meals) {
      if (user.lunchMeal == "Fish") {
        fishCount = fishCount + user.lunchCount;
        riceCount = riceCount + user.lunchCount;
        //usernames.add(user['username']);
      }
    }
    //riceCount = chickenCount + fishCount ;
    for (var user in meals) {
      if (user.lunchMeal == "Rice") {
        riceCount = riceCount + user.lunchCount;
        //usernames.add(user['username']);
      }
    }
    print(chickenCount);

   // print(meals[0].name);
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
    String messName = user.messname == "" ? "New Mess" : user.messname;
    Widget content = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals!.length,
        itemBuilder: (ctx, index) => MealState(
            userName: meals![index].name,
            mealActivity: meals![index].lunchMeal,
            mealCount: meals![index].lunchCount
        )

    );

    Widget comments = ListView.builder(

        itemCount: meals!.length,
        itemBuilder: (ctx, index) {
          String comment = meals![index].lunchComment.trim();
          if(comment.isNotEmpty) {
            return CommentShow(
                name: meals![index].name,
                comment: meals![index].lunchComment,
            );
          }
          else{
            return Container();
          }
        }
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(left: 15.0),
            color: Colors.black,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: '   Hello, ',
                    style: GoogleFonts.ebGaramond(
                      fontSize: 22,
                      fontStyle: FontStyle.italic
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to " + messName,
                  style: GoogleFonts.sourceCodePro(
                      fontSize: 18,
                      fontWeight:  FontWeight.bold

                  )
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          meals == null ? SizedBox(
              height: 150,
              child: Loader()) : SizedBox(
              height: 150,
              child: content),
      
      
          SizedBox(
              width: 320,
            height: 60,
              child: MealSummary(
                  menu: "Chicken",
                  count: chickenCount.toString(),
                  imageUrl: "assets/images/roast-chicken.png",
                textColor: Colors.brown[800],
          ),
          ),
      
          SizedBox(
            height: 8,
          ),
      
          SizedBox(
            width: 320,
            height: 60,
            child: MealSummary(
              menu: "Fish",
              count: fishCount.toString(),
              imageUrl: "assets/images/fish.png",
              textColor: Colors.teal[800],
            ),
          ),
          SizedBox(
            height: 8,
          ),
      
          SizedBox(
            width: 320,
            height: 60,
            child: MealSummary(
              menu: "Rice",
              count: riceCount.toString(),
              imageUrl: "assets/images/rice.png",
              textColor: Colors.blueGrey[800],
            ),
          ),
          SizedBox(
            height: 8,
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
                          return MealType(context: context, meal: mealTime,
                          );
                        }
                    );
                  })
          ),
          Row(
            children: [
              Text("  Comments",
                style: GoogleFonts.raleway(
                    fontSize: 18,
                   fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.white54,
          ),
      
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: 100,
                child: comments),
          )
      
        ],
      ),
    );
  }
}
