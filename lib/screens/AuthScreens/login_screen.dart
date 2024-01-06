
import 'package:flutter/material.dart';
import 'package:mess_app/screens/AuthScreens/signup_screen.dart';
import 'package:mess_app/widgets/AuthWidgets/button_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/textField_widget.dart';
import 'package:mess_app/widgets/AuthWidgets/text_widget.dart';
import 'package:mess_app/services/auth_services.dart';


class LoginScreen extends StatefulWidget {

  static const String routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthServices authService = AuthServices();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    authService.signInUser(
        context: context,
        email: emailController.text,
        password: passwordController.text);

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
                    hintText: "Your Email Address",
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
