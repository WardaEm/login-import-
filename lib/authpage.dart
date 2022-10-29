import 'package:flutter/material.dart';
import 'package:untitled2/login.dart';
import 'package:untitled2/sign_up.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage=true;
  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;

    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return Login(showSignUpPage: toggleScreen);
   }else{
    return SignUp(showLoginPage:toggleScreen );
   }
  }
}
