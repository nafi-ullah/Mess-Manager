import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/widgets/AuthWidgets/text_widget.dart';

class Counter extends StatefulWidget {
   Counter({super.key,
  required this.updateCounter,
     required this.isOn,
  });

   final Function(int) updateCounter;
   bool isOn;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  List<bool> isSelected = [false, false, false];
   int initialValue =1 ;




  void increment() {
    if(widget.isOn){
      setState(() {
        initialValue = initialValue < 9 ? initialValue + 1 : 9;
        widget.updateCounter(initialValue);
      });
    }

  }

  void decrement() {
    setState(() {
      initialValue = initialValue > 1 ? initialValue - 1 : 1;
      widget.updateCounter(initialValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isOn == true ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            decrement();
          },
          style: ElevatedButton.styleFrom(
            onPrimary: kPrimaryColor,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: kPrimaryColor),
            ),
          ),
          child: Icon(Icons.remove),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kPrimaryColor,
            border: Border.all(),
          ),
          child: Text(
            '$initialValue',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            increment();
          },
          style: ElevatedButton.styleFrom(
            onPrimary: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: kPrimaryColor),
            ),
          ),
          child: Icon(Icons.add),
        ),
      ],
    ) : Text("Your meal is off") ;
  }
}
