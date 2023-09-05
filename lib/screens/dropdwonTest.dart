import 'package:flutter/material.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:mess_app/models/members.dart';
import 'package:mess_app/widgets/EveryoneMeal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Initial Selected Value
  String dropdownvalue = 'off';
  String mealCvalue= '1';
  final _msgController = TextEditingController();
  // List of items in our dropdown menu
  // var items = [
  //   'off',
  //   'chicken',
  //   'fish',
  //   'star'
  // ];
  @override
  void dispose() {
    _msgController.dispose();
    //_msgController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EveryOneMeal(),
          Row(
            children: [
              Text('Lunch:'),
              SizedBox(width: 20,),
              DropdownButton(

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: mealCategory.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              Spacer(),
              SizedBox(width: 10,),
              Text('Quantity:'),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: DropdownButton(

                  // Initial Value
                  value: mealCvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: mealCnt.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      mealCvalue = newValue!;
                    });
                  },
                ),
              ),

            ],
          ),
           Row(
            children: [
              const Text('Comment'),
              const SizedBox(width: 8,),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _msgController,
                  //keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    //prefixText: '\$ ',
                    label: Text('About your meal'),
                  ),
                ),
              ),

            ],
          ),
          const SizedBox(height: 8.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){

                print(_msgController.text);
                print(mealCvalue);
                print(dropdownvalue);
                _msgController.clear();
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Update Meal',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  )),
            ],
          ),
          Text('Messages:'),
          SizedBox(
            //flex:2,
            height: 300,
            child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: membersInfo.length,
              //itemExtent: itemWidth,
              itemBuilder: (ctx, index)=> Text(
                membersInfo[index].personalMsg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}