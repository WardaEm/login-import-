import 'dart:ffi';
import 'forget password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
class Login extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const Login({Key? key, required this.showSignUpPage}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController=TextEditingController();
  final _passController=TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());


    // SnackBar snackBar = SnackBar(
    //   content: Text('Welcome to the app'),
    // );
    //
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
@override
  void dispose() {
_emailController.dispose();
_passController.dispose();
    super.dispose();
  }
    final user=FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
    child: Center(
      child: Column(
      children: [

      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Text(
        'Welcome!',
        style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
),
        ),
          SizedBox(height: 7,),
          Text(
            'Sign In',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
             ),
          ),
        ],
        ),
      ),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'address must not be short';
              }


          },controller: _emailController,
decoration: InputDecoration(
focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(17),
        bottomLeft: Radius.circular(17),
        topRight: Radius.circular(17),
        bottomRight: Radius.circular(17)),

    borderSide: BorderSide(
        color: Colors.deepPurple,
        style: BorderStyle.solid
    )
),

prefixIcon: Icon(Icons.email,color: Color(0xff272768)),
  hintText: 'Email',
    fillColor: Colors.grey[100],
    filled: true,
 enabledBorder:  OutlineInputBorder(

borderRadius: BorderRadius.only(topLeft: Radius.circular(17),
      bottomLeft: Radius.circular(17),
      topRight: Radius.circular(17),
      bottomRight: Radius.circular(17)),

borderSide: BorderSide(
  color: Colors.deepPurple,
  style: BorderStyle.solid
)
  )
),
          ),
        ),
        SizedBox(height:15,),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'address must not be short';
      }

    }

    ,controller: _passController,
            obscureText: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(17),
                        bottomLeft: Radius.circular(17),
                        topRight: Radius.circular(17),
                        bottomRight: Radius.circular(17)),

                    borderSide: BorderSide(
                        color: Colors.deepPurple,
                        style: BorderStyle.solid
                    )
                ),
              focusColor: Color(0xff272768),
                hintText: 'Password',
                fillColor: Colors.grey[100],
                filled: true,
                prefixIcon: Icon(Icons.visibility,color: Color(0xff272768),),
               enabledBorder:  OutlineInputBorder(

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    borderSide: BorderSide(
                        color: Color(0xff272768),
                      style: BorderStyle.solid
                    )
                )
            ),
          ),
        ),

        getWidget(false, true),
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: GestureDetector(
            onTap: signIn,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xff272768),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Text(
                  'Sign In',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              GestureDetector(

                child: Text('Forget Password?',style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 17,
                    color: Colors.deepPurple
          )),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPage()));
                },
              )
            ],
          ),
        ),
        SizedBox(height:5 ),
        Text('Or',style: TextStyle(
            fontWeight: FontWeight.w500,fontSize: 20
        ),),
SizedBox(height: 15,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
 Container(
height: 35,width: 40,
     decoration: BoxDecoration(

   color: Colors.white,
   border:Border.all(
width: 1,
     color: Colors.black
   )
 ),child: SvgPicture.asset('images/google.svg',width: 25,height: 20,)),
    SizedBox(width: 10,),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
        child: SvgPicture.asset('images/face.svg')),

  ],
),
SizedBox(height: 25,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Dont have an account?',style: TextStyle(
                  fontWeight: FontWeight.w700,fontSize: 20
              ),),
              GestureDetector(
                onTap: widget.showSignUpPage,
                child: Text('Sign Up',style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 17,
                    color: Colors.deepPurple
                ),),
              ),
            ],
          ),
        ),
      ]),
    )));
  }



  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,

        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          print(gender);
        },
        //Alignment between icons
        equallyAligned: true,

        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 55, //default : 40
      ),
    );
  }}

