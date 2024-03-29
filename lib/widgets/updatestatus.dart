import 'package:flutter/material.dart';
import 'package:mess_app/router.dart';
import 'package:mess_app/screens/dropdwonTest.dart';



class UpdateStus extends StatelessWidget {
  const UpdateStus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                child: Image.asset("assets/images/updategif.gif")),
            ElevatedButton(onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  generateRoute(
                      RouteSettings(name: MyHomePage.routeName)
                  ),
                  //MaterialPageRoute(builder: (context) => HomeScreen()), same as above
                      (route) => false);

            },

                child: Text("Go back"))
          ],
        ),
      ),
    );
  }
}
