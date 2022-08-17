import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../View/Otp Screen.dart';



class phoneNumberAndContinue extends StatefulWidget {

  phoneNumberAndContinue({Key? key,
  }) : super(key: key);

  @override
  State<phoneNumberAndContinue> createState() => _phoneNumberAndContinueState();
}

class _phoneNumberAndContinueState extends State<phoneNumberAndContinue> {

  final picker = const FlCountryCodePicker();
   CountryCode?  countryCode;
  final TextEditingController _phoneNumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    return
      Center(
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 340,
                height: 47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.5
                    )
                ),
                child: TextFormField(
                  controller:_phoneNumber,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) async{
                    if(countryCode == null){
                    final code =
                    await picker.showPicker(context: context);
                    setState(
                            () {
                      countryCode = code;
                            }
                            );
                    }
                    },
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9B9B9B),
                  ),
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9B9B9B),
                    ),
                    border: InputBorder.none,
                    prefixIcon:InkWell(
                      onTap: () async{
                        final code =
                        await picker.showPicker(context: context);
                        setState(() {
                          countryCode = code;
                        }
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            child: countryCode != null?
                            countryCode!.flagImage
                            : null,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            countryCode?.dialCode?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9B9B9B),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 1,
                            height: 25,
                            color: Colors.grey.withOpacity(0.5),
                          )
                        ],
                      ),
                    ) ,
                  ),
                )
            ),

            const SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: (){
                if(_phoneNumber.text != ""){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => otpScreen(
                                number: "${countryCode?.dialCode}${_phoneNumber.text}",
                              )
                      )
                  );
                }else if(countryCode?.dialCode == "")
                  {
                    Fluttertoast.showToast(
                        msg: "Please Select The Country",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                    );
                  }else
                {
                Fluttertoast.showToast(
                msg: "Please Enter Phone Number",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
                );
                }
              },
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffBFFB62),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
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
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}


