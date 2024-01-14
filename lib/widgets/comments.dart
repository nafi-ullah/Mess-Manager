import 'package:flutter/material.dart';


class Comments extends StatelessWidget {
  const Comments(

      {super.key,
        required  this.userName,
        required this.comment

      });

  final String userName;
  final String comment;


  @override
  Widget build(BuildContext context) {
    //String mealName = mealActivity.toString().split('.').last;

    return Row(
      children: [
        Text(userName),
        Text(" : "),
        Text(comment),

      ],
    );
  }
}
