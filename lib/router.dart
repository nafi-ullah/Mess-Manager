
import 'package:flutter/material.dart';
import 'package:mess_app/screens/AuthScreens/login_screen.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/screens/feedScreen.dart';
import 'package:mess_app/screens/homescreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case MyHomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyHomePage(),
      );
    case Feed.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Feed(),
      );


    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
              body: Center(
                child: Text("Screen doesn't exist"),)
          )

      );


  }


}