import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';

class BazarData extends StatelessWidget {
  const BazarData({super.key});

  @override
  Widget build(BuildContext context) {
    String doneName = "Bipul";
    String bazarDate = "18-01-2024";
    String total = "2000";
    List<DataRow> filteredRows = [];
    List<String> bazarD = [];
    List<String> quantityD = [];
    List<int> costD = [];

    List<DataRow> getFilteredRows(String userName) {
      for (int i=0; i<bazarD.length; i++ ) {
          filteredRows.add(
            DataRow(
              cells: [
                DataCell(Text(bazarD[i])),
                DataCell(Text(quantityD[i])),
                DataCell(Text(costD[i].toString())),
              ],
            ),
          );

      }

      return filteredRows;
    }



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
                style: TextStyle(color: Colors.white,
                fontSize: 15.0
                ),
              ),
              Spacer(),
              Text(
                'Date: ${bazarDate}',
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

          SizedBox(height: 10.0),
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

              rows: [
                DataRow(
                  cells: [
                    DataCell(Text("Alu")),
                    DataCell(Text("200gm")),
                    DataCell(Text("500")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Alu")),
                    DataCell(Text("200gm")),
                    DataCell(Text("500")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Alu")),
                    DataCell(Text("200gm")),
                    DataCell(Text("500")),
                  ],
                ),
              ]
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
              Text("Total: ${total}",
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
