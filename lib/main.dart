import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/Signin and Signup.dart';


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
      title: 'Dyeus',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:
      signinAndSignup(),
    );
  }
}
