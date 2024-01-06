import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/counter.dart';

class MealType extends StatefulWidget {
   MealType({super.key, required this.meal});

  String meal;

  @override
  State<MealType> createState() => _MealTypeState();
}

class _MealTypeState extends State<MealType> {
  List<bool> isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          height: 15,
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
      ],
    );
  }
}
