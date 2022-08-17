
import 'package:dyeus/View/Signup%20page.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Signin and Signup.dart';
import 'Signin page.dart';

class signinAndSignup extends StatefulWidget {
   signinAndSignup({Key? key}) : super(key: key);


  @override
  State<signinAndSignup> createState() => _signinAndSignupState();
}

class _signinAndSignupState extends State<signinAndSignup> {


 PageController _Controller = PageController(initialPage: 0,);
 int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          const SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 170,
                child: Center(
                  child: ToggleSwitch(
                    borderWidth: 1,
                    borderColor: [
                      Colors.grey.withOpacity(0.2),
                    ],
                    fontSize: 14,
                    minHeight: 40,
                    minWidth: 80.0,
                    cornerRadius: 35.0,
                    activeBgColors: const [[Color(0xffBFFB62)], [Color(0xffBFFB62)]],
                    activeFgColor: const Color(0xffBFFB62),
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: currentIndex,
                    totalSwitches: 2,
                    labels: const ['Signin', 'Signup'],
                    customTextStyles: const [
                      TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "Cera Pro",
                          fontWeight: FontWeight.w500
                      ),
                    ],
                    radiusStyle: true,
                    onToggle: (index) {
                       _Controller.jumpToPage(index!);
                       },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 500,
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              controller: _Controller,
              children: const [
                signIn(),
                signUp()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              setState(() {
                currentIndex =1;
              });
              _Controller.jumpToPage(1);

            },
            child: Center(
              child: RichText(
                text: const TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Cera Pro"
                    ),
                    children:[
                      TextSpan(
                        text: "Signup",
                        style:
                        TextStyle(
                            color: Color(0xffBFFB62),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Cera Pro"
                        ),
                      )
                    ]
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
