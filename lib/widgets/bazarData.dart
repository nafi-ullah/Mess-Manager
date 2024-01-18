import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';

class BazarData extends StatefulWidget {
   BazarData({super.key,

     required this.name,
     required this.date,
     required this.bazar,
    required this.quantity,
    required this.cost

  });

   final String name;
   final String date;
   final List<String> bazar;
   final List<String> quantity;
   final List<int> cost;

  @override
  State<BazarData> createState() => _BazarDataState();
}

class _BazarDataState extends State<BazarData> {
  List<DataRow> filteredRows = [];
  int TotalCost = 0;
  // List<String> bazarD = [];
  // List<String> quantityD = [];
  // List<int> costD = [];


  void getFilteredRows() {
    setState(() {


      for (int i=0; i<widget.bazar.length; i++ ) {
        filteredRows.add(
          DataRow(
            cells: [
              DataCell(Text(widget.bazar[i])),
              DataCell(Text(widget.quantity[i])),
              DataCell(Text(widget.cost[i].toString())),
            ],
          ),
        );

      }
    });

  //  print(widget.cost);
  }

  void totalCosting(){
    setState(() {
      int sum = 0;
      for (int value in widget.cost) {
        sum += value;
      }
      TotalCost = sum;
      print(TotalCost);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilteredRows();
    totalCosting();
  }


  @override
  Widget build(BuildContext context) {
    //String doneName = "Bipul";
    //String bazarDate = "18-01-2024";
    String total = "2000";





    return Container(
      width: double.infinity, // Full width
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
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
                'Done By: ${widget.name}',
                style: TextStyle(color: Colors.white,
                fontSize: 15.0
                ),
              ),
              Spacer(),
              Text(
                'Date: ${widget.date}',
                style: TextStyle(color: Colors.white,
                    fontSize: 15.0
                ),
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

          SizedBox(height: 4.0),
          DataTable(
              columns: [
                DataColumn(label: Text('Item ',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
                )),
                DataColumn(label: Text('Quantity',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                  ),
                )),
                DataColumn(label: Text('Price',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                  ),
                )),
              ],

              rows: filteredRows
              // [
              //   DataRow(
              //     cells: [
              //       DataCell(Text("Alu")),
              //       DataCell(Text("200gm")),
              //       DataCell(Text("500")),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(Text("Alu")),
              //       DataCell(Text("200gm")),
              //       DataCell(Text("500")),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(Text("Alu")),
              //       DataCell(Text("200gm")),
              //       DataCell(Text("500")),
              //     ],
              //
              //   ),
              //
              // ]
          ),
          Container(
            height: 2.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white54,

            ),
          ),
          Row(
            children: [
              Spacer(),
              Text("Total: ${TotalCost}",
                style: TextStyle(
                    fontSize: 16.0,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 30.0,
              )
            ],

          )
        ],
      ),
    );
  }
}
