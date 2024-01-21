import 'package:flutter/material.dart';
import 'dart:math';
class CommentShow extends StatelessWidget {
   CommentShow({super.key,
   required this.name,
     required this.comment
   });

   final String name;
   final String comment;

  final List<Color> imageColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.white70,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
  ];

  Color getRandomColor() {
    final Random random = Random();
    return imageColors[random.nextInt(imageColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: getRandomColor(),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage("assets/images/avatar.png"), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            // You can replace the AssetImage with your own image asset.
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  comment,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
