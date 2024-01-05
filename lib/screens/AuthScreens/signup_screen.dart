import 'package:flutter/material.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/social_button_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/textField_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/text_widget.dart';

enum Membership{
  manager,
  member
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController messidController = TextEditingController();
  bool obscureText = true;
  Membership _membership = Membership.manager;
  double texSize = 18;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    messidController.dispose();
  }

  void register() async {

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 20,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                child: Image.asset("assets/images/image.png"),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 21.0),
              height: MediaQuery.of(context).size.height / 1.67,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title: "Sign-up",
                        txtSize: 30,
                        txtColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),

                  TextWidget(
                    title: "Name",
                    txtSize: texSize,
                    txtColor: const Color(0xffdddee3),
                  ),
                  InputTxtField(
                    hintText: "Your Name",
                    controller: nameController,
                    validator: null,
                    obscureText: false,
                  ),
                  TextWidget(
                    title: "Email",
                    txtSize: texSize,
                    txtColor: const Color(0xffdddee3),
                  ),
                  InputTxtField(
                    hintText: "Your Email id",
                    controller: emailController,
                    validator: null,
                    obscureText: false,
                  ),
                  TextWidget(
                    title: "Password",
                    txtSize: texSize,
                    txtColor: const Color(0xffdddee3),
                  ),

                  InputTxtField(
                    hintText: "Password",
                    controller: passwordController,
                    validator: null,
                    obscureText: true,
                  ),
                  // TextWidget(
                  //   title: "Mess Id",
                  //   txtSize: texSize,
                  //   txtColor: const Color(0xffdddee3),
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(children: [
                    Expanded(
                      child: ListTile(
                        //tileColor: const Color(0xffdddee3),
                        title:  const Text("Create Mess",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            )
                        ),
                        leading: Radio(
                            activeColor: Theme.of(context).primaryColor,
                            value: Membership.manager,
                            groupValue: _membership,
                            onChanged: (Membership? val){
                              setState(() {
                                _membership = val! ;
                              });

                            }),

                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        //tileColor: const Color(0xffdddee3),
                        title:  const Text("Join Mess",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            )
                        ),
                        leading: Radio(
                            activeColor: Theme.of(context).primaryColor,
                            value: Membership.member,
                            groupValue: _membership,
                            onChanged: (Membership? val){
                              setState(() {
                                _membership = val! ;
                              });

                            }),

                      ),
                    ),
                  ],),
                  if(_membership == Membership.member)
                  Padding(
                   padding: const EdgeInsets.only(bottom: 1.0),
                    child: InputTxtField(
                      hintText: "Your Mess ID",
                      controller: messidController,
                      validator: null,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonWidget(
                      btnText: "Signup",
                      onPress: register,
                    ),
                  ),

                  // Center(
                  //   child: SocialButtonWidget(
                  //       bgColor: Colors.white,
                  //       imagePath: 'assets/Gmail.png',
                  //       onPress: ()  {}),
                  // ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}