import 'package:dyeus/View/Final%20Otp%20Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../Model/Signin And Signup Subtitle.dart';
import '../Model/Signin and Signup Title.dart';


class otpScreen extends StatefulWidget {
  String number;
   otpScreen({Key? key,
   required this.number}) : super(key: key);
   @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {

  final controller = TextEditingController();
  final focusNode = FocusNode();
   bool resendOtp = false;
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    dispose();
  }

  @override
  Widget build(BuildContext context) {

    const borderColor = Color.fromRGBO(30, 60, 87, 1);
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 38,
      ),
      decoration: BoxDecoration(),
    );
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0,top: 50,bottom: 10),
              child: IconButton(onPressed: (){
                Navigator.pop(context);
              },
                  icon: const Icon(Icons.arrow_back_rounded)
              ),
            ),
          ),
          title("Enter OTP"),
          const SizedBox(
            height: 20,
          ),
          subTitle("An five digit has been code sent to ${widget.number}"),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10),
              child: RichText(
                text: const TextSpan(
                    text: "Incorrect number? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Cera Pro"
                    ),
                    children:[
                      TextSpan(
                        text: "Change",
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 340,
              child: Pinput(
                length: 6,
                pinAnimationType: PinAnimationType.slide,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                cursor: cursor,
                preFilledWidget: preFilledWidget,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: (){
            if(resendOtp) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => finalOtpScreen(
                              number: widget.number,
                        )
                    )
                );
              }
            },
            child: Center(
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: resendOtp? const Color(0xffBFFB62) : const Color(0xffEDFFD0),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Center(
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: "Cera Pro",
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: resendOtp? 0:1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Resend OTP ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Cera Pro",
                      fontWeight: FontWeight.w500
                  )),
                Countdown(
                  seconds: 30,
                  build: (BuildContext context, double time) => Text("${time.toString()}s",
                      style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Cera Pro",
                      fontWeight: FontWeight.w500
                      )
                  ),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    setState(
                            () {
                      resendOtp = !resendOtp;
                    }
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
