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
  List<bool> isSelected = [false, false, false, false];
  List<mealMenu> whichMeal=[
      mealMenu.Off,
      mealMenu.Chicken,
      mealMenu.Fish,
      mealMenu.Rice
  ];
  TextEditingController commentController = TextEditingController();



  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
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
        Counter(),
        SizedBox(
          height: 25,
        ),
        SizedBox(
            height: 30,
            width: 200,
            child: ButtonWidget(textSize: 15,
                btnText: "Update", onPress:(){
                  //mealUpdate();

                })
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
