import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/dummydata/dummy%20widgets.dart';
import 'package:mess_app/models/auth_model.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/router.dart';
import 'package:mess_app/screens/AuthScreens/welcome_screen.dart';
import 'package:mess_app/screens/accountUpdate.dart';
import 'package:mess_app/screens/bazarShow.dart';
import 'package:mess_app/screens/chatui.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/screens/homescreen.dart';
import 'package:mess_app/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider())
  ],

      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

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
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ChatCommunication()//Provider.of<UserProvider>(context, listen: false).user.token.isNotEmpty ? const MyHomePage() : const WelcomeScreen()
    );
  }
}