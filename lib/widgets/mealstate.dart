import 'package:flutter/material.dart';
import 'package:mess_app/dummydata/memberdata.dart';
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
  //String mealName = mealActivity.toString().split('.').last;
    List<String> foodStatus = [
    "assets/images/roast-chicken.png",
    "assets/images/fish.png",
    "assets/images/rice.png",
    "assets/images/nofood.png"
    ];
    String showFood ;
    if(mealActivity == "Chicken"){
       showFood = foodStatus[0];
    }
    else if(mealActivity == "Fish"){
      showFood = foodStatus[1];
    }
    else if(mealActivity == "Rice"){
      showFood = foodStatus[2];
    }else{
      showFood = foodStatus[3];
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 120,
        width: 80,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Stack(

                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset("${showFood}",
                    height: 60, width: 60,
                    )
                  ),
                  Positioned(
                    bottom: 15,
                    right: 16,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mealActivity == "Off" ? Colors.black : Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'x${mealCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

        Container(
          margin: EdgeInsets.only(right: 10.0),
          width: 60.0,
          height: 30,
          decoration: BoxDecoration(
            color:  Colors.black,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: Colors.white, // Border color
              width: 2.0, // Border width
            ),
          ),
          child: Center(
            child: Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),

          ],
        ),
      ),
    );
  }
}
