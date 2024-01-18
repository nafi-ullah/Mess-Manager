import 'package:flutter/material.dart';

class BazarData extends StatelessWidget {
  const BazarData({super.key});

  @override
  Widget build(BuildContext context) {
    String doneName = "Bipul";
    String bazarDate = "18-01-2024";

    return Container(
      width: double.infinity, // Full width
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        border: Border.all(
          color: Colors.red,
        ),
      ),
      constraints: BoxConstraints(minHeight: 100.0), // Adjust height based on content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Done By: ${doneName}',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              Text(
                'Date: ${bazarDate}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
            height: 2.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white54,

            ),
          ),

          SizedBox(height: 10.0),
          Text(
            'Another Text Widget',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
