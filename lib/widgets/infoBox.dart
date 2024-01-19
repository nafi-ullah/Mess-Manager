import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
   InfoBox({super.key,
  required this.title,
    required this.data
  });
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 15.0,),
      Row(children: [
        Text(title,
        style: TextStyle(
          fontSize: 20
        ),
        ),
        Spacer(),
        Text(data,  style: TextStyle(
            fontSize: 18,
            color: Colors.white54
        ),)
      ],),
      SizedBox(height: 10.0,),
      Container(
        height: 1.0,
        color: Colors.white38,
      )
    ],);
  }
}
