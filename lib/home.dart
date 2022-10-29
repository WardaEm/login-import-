import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/login.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user=FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(showSignUpPage: () {  },)));
          },
        ),
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

            MaterialButton(
          child: Text('signed in as:'+user.email!),
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title:Text('Hello '+user.email!) ,
                    backgroundColor: Colors.red,
                    elevation: 100,
                    content: Text('dfghjkl;lkyhfdfghoifdihgfdtyuioiu'),


                  );
                }
                );

            },
            ),


                MaterialButton(onPressed: (){
                  FirebaseAuth.instance.signOut();

          },
                  color: Colors.deepPurple,child: Text('Sign out',style: TextStyle(color: Colors.white),),),

        ],
      )),

    );
  }

  }

