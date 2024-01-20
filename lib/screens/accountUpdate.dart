import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/main.dart';
import 'package:mess_app/provider/user_provider.dart';
import 'package:mess_app/screens/dropdwonTest.dart';
import 'package:mess_app/services/auth_services.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/infoBox.dart';
import 'package:provider/provider.dart';

import '../widgets/AuthWidgets/textField_widget.dart';

class AccountUpdatePage extends StatefulWidget {
  @override
  _AccountUpdatePageState createState() => _AccountUpdatePageState();
}

class _AccountUpdatePageState extends State<AccountUpdatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController messIdController = TextEditingController();
  TextEditingController messNameController = TextEditingController();
  final AuthServices authService = AuthServices();
  bool isEditable = false;
  String buttonText =  "Edit Profile";


    void EditProfile(){
      setState(() {
        isEditable = true;
      });
    }
    void UpdateProfile(TextEditingController messName){
      final user = Provider.of<UserProvider>(context, listen: false).user;
          authService.messNameChange(context: context,
              email: user.email,
              messid: user.messid,
              messname: messName.text);


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
            (route) => false, // Set to false to remove all previous pages
      );

      setState(() {
        isEditable = false;
      });
    }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final double headSize = 18;
    final double boxSize = 25;
    final double boxTextFont = 16;


    return Scaffold(

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor
        ),
        
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Account Update", style: TextStyle(
                    fontSize: 22
                  ),
                  ),
                ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Spacer(),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/image.png'), // Change this to your image
                  ),
                  Spacer(),
                ],
              ),
             SizedBox(height: 40,),
             Expanded(
               child: Container(
                 decoration: const BoxDecoration(
                   color: kBackgroundColor,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                 ),

                 child: Padding(
                   padding: const EdgeInsets.all(22.0),
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         const  SizedBox(height: 10),
                         InfoBox(title: "Name", data: user.name),
                         InfoBox(title: "Email", data: user.email),
                         InfoBox(title: "Password", data: "* * * * * * * *"),
                         InfoBox(title: "Mess Id", data: user.messid),
                         isEditable ? Column(children: [
                           SizedBox(height: 15.0,),
                           Row(children: [
                             Text("Mess Name",
                               style: TextStyle(
                                   fontSize: 20
                               ),
                             ),
                            SizedBox(width: 30,),
                             SizedBox(
                               width: 150,
                               child: InputTxtField(
                                 hintText: "Enter mess name",
                                 controller: messNameController,
                                 validator: null,
                                 obscureText: false,
                               ),
                             ),
                           ],
                           ),
                           SizedBox(height: 10.0,),
                           Container(
                             height: 1.0,
                             color: Colors.white38,
                           )
                         ],) :InfoBox(title: "Mess Name", data: user.messname)  ,
                        SizedBox(height: 30,),
                         SizedBox(
                           width: 300,
                           child: ButtonWidget(textSize: 14,
                               btnText: isEditable ? "Update Profile" : "Edit Profile",
                               onPress: () {
                                 isEditable ? UpdateProfile(messNameController)
                                     : EditProfile();
                               }
    ),
                         )
                     
                     
                     
                       ],
                     ),
                   ),
                 ),
               ),
             ),
                
                
                
            ],
          ),
        ),
      ),
    );
  }
}