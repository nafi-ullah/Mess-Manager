import 'package:flutter/material.dart';
import 'package:mess_app/constants/constants.dart';
import 'package:mess_app/provider/user_provider.dart';
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
  bool isEditable = false;
  String buttonText =  "Edit Profile";


    void EditProfile(){
      setState(() {
        isEditable = true;
      });
    }
    void UpdateProfile(){
      setState(() {
        isEditable = false;
      });
    }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Account Update", style: TextStyle(
                    fontSize: 22
                  ),
                  ),
                ),

              SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/image.png'), // Change this to your image
              ),
             SizedBox(height: 70,),
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
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const  SizedBox(height: 20),
                         InfoBox(title: "Name", data: "John Dae"),
                         InfoBox(title: "Email", data: "john@gmail.com"),
                         InfoBox(title: "Password", data: "* * * * * * * *"),
                         InfoBox(title: "Mess Id", data: "xyz123"),
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
                         ],) :InfoBox(title: "Mess Name", data: "Blue whales")  ,
                        SizedBox(height: 30,),
                         SizedBox(
                           width: 300,
                           child: ButtonWidget(textSize: 14,
                               btnText: isEditable ? "Update Profile" : "Edit Profile",
                               onPress: isEditable? UpdateProfile : EditProfile),
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