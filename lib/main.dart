import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/main_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(

          systemOverlayStyle: SystemUiOverlayStyle(

            // statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark
          )
        )
      ),
      home: MainPage(),
    );
  }
}

