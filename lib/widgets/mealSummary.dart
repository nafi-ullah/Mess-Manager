import 'package:flutter/material.dart';

class MealSummary extends StatelessWidget {
   MealSummary({super.key,
  required this.textColor,
    required this.menu,
    required this.count,
    required this.imageUrl
  });


   final String menu;
   final String count;
   final String imageUrl;
   final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 186, 163, 1), // Light red color
        borderRadius: BorderRadius.circular(6.0), // Rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Small Image on the left
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imageUrl), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.0), // Add spacing between image and text
          // Text on the right with golden color
          Text(
            '${menu} ',
            style: TextStyle(
              color: textColor, // Golden color
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' Dish : ',
            style: TextStyle(
              color: Colors.white, // Golden color
              fontSize: 16.0,
             // fontWeight: FontWeight.white,
            ),
          ),
          Text(
            '${count} ',
            style: TextStyle(
              color: textColor, // Golden color
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),

          ),
          Text(
            menu == "Rice"? 'Plates' : 'Pieces',
            style: TextStyle(
              color: Colors.white, // Golden color
              fontSize: 16.0,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
