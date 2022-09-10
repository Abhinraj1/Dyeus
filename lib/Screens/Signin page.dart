import 'package:dyeus/Widgets/Signin%20And%20Signup%20Subtitle.dart';
import 'package:dyeus/Widgets/Signin%20and%20Signup%20Title.dart';
import "package:flutter/material.dart";
import 'package:toggle_switch/toggle_switch.dart';

import '../Widgets/Enter phone number and Continue.dart';
import '../Widgets/Or Signup With.dart';

class signIn extends StatelessWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          title("Welcome Back!!"),
          const SizedBox(
            height: 20,
          ),
          subTitle("Please login with your phone number."),
          phoneNumberAndContinue(),
          signupOptions(context),
        ],
      ),
    );
  }
}
