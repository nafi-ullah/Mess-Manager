import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mess_app/models/memberDB.dart';
import 'package:mess_app/models/members.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/counter.dart';

class MealType extends StatefulWidget {
   MealType({super.key,
     required this.context,
     required this.meal});

   BuildContext context;
  String meal;

  @override
  State<MealType> createState() => _MealTypeState();
}

class _MealTypeState extends State<MealType> {
  List<bool> isSelected = [true, false, false, false];
  List<MealMenu> whichMeal=[
      MealMenu.Off,
      MealMenu.Chicken,
      MealMenu.Fish,
      MealMenu.Rice
  ];

  TextEditingController commentController = TextEditingController();

   String userId = "";
   String memberName = "";
   String mealMenu = "";
   int Count= 0;
   MealTime mealTime = MealTime.Lunch;
   //DateTime date= DateTime(2023);
   String personalMsg= "";

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  void mealUpdate(){
    print(mealMenu);
    print(commentController.text);
    print(Count);
  }
  void _updateCounter(int newCounterValue) {
    setState(() {
      Count = newCounterValue;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

    //     SizedBox(
    //       height: 25,
    // ),
        SizedBox(
          width: 250,
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                borderSide: BorderSide( // <--- Add this line
                  color: Colors.blue, // Choose the border color
                  width: 3.0, // Choose the border width
                  style: BorderStyle.solid, // Choose the border style
                ),
              ),
              hintText: 'Enter text',
              labelText: 'Comment',
            ),
          ),
        ),
            SizedBox(
              height: 20,
        ),
        Container(
         //
          decoration: BoxDecoration(
              color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: kPrimaryColor)
          ),

          child: Column(
            children: [
              Text("Your Meal For " + widget.meal, style: TextStyle(
                fontSize: 15
              ),),
              ToggleButtons(children: [
                Icon(Icons.no_food),
                Icon(FontAwesomeIcons.drumstickBite),
                Icon(FontAwesomeIcons.fish),
                Icon(FontAwesomeIcons.bowlRice),

              ],
                  isSelected: isSelected,
              color: Colors.white,
              selectedColor: Colors.blue,
              selectedBorderColor: kPrimaryColor,
              fillColor: Colors.white,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              borderColor: kPrimaryColor,

                onPressed: (int index) {
                  setState(() {
                     mealMenu = whichMeal[index].toString().split('.').last;

                    for (int i = 0; i < isSelected.length; i++) {

                      isSelected[i] = i == index;
                    }
                  });
                },
                // Pass the list of boolean values

              ),

            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Counter(updateCounter: _updateCounter,),
        SizedBox(
          height: 25,
        ),
        SizedBox(
            height: 30,
            width: 200,
            child: ButtonWidget(textSize: 15,
                btnText: "Update",
                onPress: (){
                  mealUpdate();
                  Navigator.pop(widget.context);
                }
            )
        ),

        SizedBox(height: 15,),
        SizedBox(
            height: 30,
            width: 200,
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
             onPressed: () {
             Navigator.pop(widget.context); // Close the bottom sheet on button press
          },
                  child: Text('Cancel', style: TextStyle(
                    color: Colors.black54
                  ),),
           ),
                )
      ],
    );
  }
}
