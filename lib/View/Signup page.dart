import 'package:dyeus/Model/Signin%20And%20Signup%20Subtitle.dart';
import 'package:dyeus/Model/Signin%20and%20Signup%20Title.dart';
import "package:flutter/material.dart";
import 'package:toggle_switch/toggle_switch.dart';

import '../Model/Enter phone number and Continue.dart';
import '../Model/Or Signup With.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          title("Welcome to App"),
          const SizedBox(
            height: 20,
          ),
          subTitle("Please signup with your phone number to get registered"),
          phoneNumberAndContinue(),
          signupOptions(context),






        ],
      ),
    );
  }
}


