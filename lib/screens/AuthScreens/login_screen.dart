
import 'package:flutter/material.dart';
import 'package:mess_app/screens/AuthScreens/signup_screen.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/textField_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/text_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {

    final String email = emailController.text;
    final String password = passwordController.text;
    try {

    } catch (e) {
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  title: "Error",
                  txtSize: 25.0,
                  txtColor: Colors.white,
                ),
                content: TextWidget(
                  title: "Please fill the fields",
                  txtSize: 20.0,
                  txtColor: Colors.white,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: TextWidget(
                      title: "Ok",
                      txtSize: 18.0,
                      txtColor: Colors.blue,
                    ),
                  ),
                ],
              );
            });
      }
      if (1==1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: TextWidget(
              title: "No User Found for that Email",
              txtSize: 18.0,
              txtColor: Theme.of(context).primaryColor,
            ),
          ),
        );
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: TextWidget(
              title: "Wrong Password Provided by User",
              txtSize: 18.0,
              txtColor: Theme.of(context).primaryColor,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              height: 50,
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
                      title: "Log-in",
                      txtSize: 30,
                      txtColor: Theme.of(context).primaryColor,
                    ),
                  ],),

                  TextWidget(
                    title: "Email",
                    txtSize: 22,
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
                    txtSize: 22,
                    txtColor: const Color(0xffdddee3),
                  ),
                  InputTxtField(
                    hintText: "Password",
                    controller: passwordController,
                    validator: null,
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: TextWidget(
                          title: "Forget password?",
                          txtSize: 18,
                          txtColor: const Color(0xff999a9e),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ButtonWidget(
                      btnText: "Login",
                      onPress: login,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title: "Don't have an account? ",
                        txtSize: 18,
                        txtColor: const Color(0xff999a9e),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                          ),
                          );
                        },
                        child: TextWidget(
                          title: "Sign-Up ",
                          txtSize: 18,
                          txtColor: const Color(0xff999a9e),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
