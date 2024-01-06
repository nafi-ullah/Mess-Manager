import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/screens/AuthScreens/welcome_screen.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/screens/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider())
  ],


      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
          secondaryHeaderColor: const Color(0xFF151a1d),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }
}