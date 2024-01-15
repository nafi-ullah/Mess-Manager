import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/dummydata/memberdata.dart';
import 'package:mess_app/models/members.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/screens/communication/msg_call.dart';
import 'package:mess_app/screens/feedScreen.dart';
import 'package:mess_app/widgets/EveryoneMeal.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {

  static const String routeName = '/home-page';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _page = 2;
  List<Widget> pages = [

    const Center(child: Text("Month List"),),
    const Center(child: Text("Bazar"),),
    const Feed(),
    const Communication(),
    const Center(child: Text("Account"),),
  ];


  // Initial Selected Value
  String dropdownvalue = 'off';
  String mealCvalue= '1';
  final _msgController = TextEditingController();




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
              color: Colors.black,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                child: Image.asset("assets/images/managerlogo.png")
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
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: kBackgroundColor,
          color: Colors.black,
          index: 2,
          items: <Widget>[
            Icon(Icons.list_alt, size: 30, color: kPrimaryColor,),
            Icon(Icons.shopping_cart_outlined, size: 30, color: kPrimaryColor,),
            Icon(Icons.home, size: 30, color: kPrimaryColor,),
            Icon(Icons.message_outlined, size: 30, color: kPrimaryColor,),
            Icon(Icons.account_circle_outlined, size: 30, color: kPrimaryColor,),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      resizeToAvoidBottomInset: false,
      body: pages[_page],
    );
  }
}