
import 'package:flutter/material.dart';
import 'package:mess_app/screens/AuthScreens/login_screen.dart';
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