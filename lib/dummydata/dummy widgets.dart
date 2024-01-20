import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:mess_app/models/members.dart';
import 'package:mess_app/widgets/EveryoneMeal.dart';

class DummyHomePage extends StatefulWidget {

  static const String routeName = '/home-page';
  const DummyHomePage({Key? key}) : super(key: key);

  @override
  _DummyHomePageState createState() => _DummyHomePageState();
}

class _DummyHomePageState extends State<DummyHomePage> {


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
      body: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  foregroundImage: null,
                ),
              ),
              Positioned(
                bottom: 15,
                right: 16,
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      'x2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      )
    );
  }
}