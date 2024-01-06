import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:mess_app/models/members.dart';
import 'package:mess_app/widgets/EveryoneMeal.dart';

class MyHomePage extends StatefulWidget {

  static const String routeName = '/home-page';
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
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text("Mess Manager")
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
                height: 80,
                child: ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  itemCount: membersInfo.length,
                  //itemExtent: itemWidth,
                  itemBuilder: (ctx, index)=> Text(
                    membersInfo[index].personalMsg,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Text("Your total chicken count this month: "),
              Text("Your total Fish count this month: "),
              Text("Your total Star count this month: "),
            ],
          ),
        ),
      ),
    );
  }
}