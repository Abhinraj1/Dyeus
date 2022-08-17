import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import '../Model/Signin And Signup Subtitle.dart';
import '../Model/Signin and Signup Title.dart';



class finalOtpScreen extends StatefulWidget {
  String number;
  finalOtpScreen({Key? key,
  required this.number,
  }) : super(key: key);

  @override
  State<finalOtpScreen> createState() => _finalOtpScreenState();
}

class _finalOtpScreenState extends State<finalOtpScreen> {

  final otpController = TextEditingController();
  final focusNode = FocusNode();
  bool receivedOtp = false;
  User? user;
  String verificationID = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    AltSmsAutofill().unregisterListener();
    dispose();
  }
@override
  void initState() {
  sendOtp();
    super.initState();
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

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 340,
              child: Pinput(
                androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsRetrieverApi,
                closeKeyboardWhenCompleted: true,
                listenForMultipleSmsOnAndroid: true,
                onCompleted: (value){
                  setState(() {
                    receivedOtp = !receivedOtp;
                  });
                },
                length: 6,
                pinAnimationType: PinAnimationType.slide,
                controller: otpController,
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
              verifyOTP();
            },
            child: Center(
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: receivedOtp? Color(0xffBFFB62) : Color(0xffEDFFD0),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Center(
                  child: Text(
                    "Done",
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
            height: 20,
          ),
          const Center(
            child: Text(
              "Don’t you receive any code?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Cera Pro",
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  sendOtp();
                });
              },
              child: const Text(
                "Re-send Code",
                style: TextStyle(
                    color: Color(0xffBFFB62),
                    fontSize: 14,
                    fontFamily: "Cera Pro",
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> initSmsListener() async {
    String? commingSms = "";
    try {
      commingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    setState(() {
      otpController.text = commingSms!;
      receivedOtp = !receivedOtp;
    });

  }


  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otpController.text);
    await auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (otpController.text == ""){
          Fluttertoast.showToast(
            msg: "Please enter OTP",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }else {
            Fluttertoast.showToast(
            msg: "your login has failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
            );
            }
      },
    );
  }

  Future<void> sendOtp() async {
    try{
     initSmsListener();
      auth.verifyPhoneNumber(
        phoneNumber: widget.number,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
          setState(() {});
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationID = verificationId;
          setState(() {});
          },
      );
    }catch (e) {
     Fluttertoast.showToast(
       msg: "Time out verify NUmber: $e",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0,
     );
   }
  }
}
