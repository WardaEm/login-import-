import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage ({Key? key}) : super(key: key);

  @override
  State< ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _emailController=TextEditingController();

  @override
  void dispose() {
 _emailController.dispose();
    super.dispose();
  }


  Future passwordReset()async{

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail
        (email:_emailController.text.trim());
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text("password reset chech your email!"),
        );
      }
      );
    } on FirebaseAuthException  catch(e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
     leading: Icon(Icons.arrow_back_ios_sharp),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Enter Your Email and we will send a password to reset',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,
                color: Colors.black54),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
          SizedBox(height: 15,),
          MaterialButton(onPressed: passwordReset,
          child: Text(
            'Reset password',

          ),
            color: Colors.indigo,
          )
        ],
      ),
    );
  }

}
