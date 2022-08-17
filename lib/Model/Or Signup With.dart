import 'package:flutter/material.dart';

signupOptions(context){
  return
      Center(
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 145,
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color:Color(0xffE2E2E2),
                    ),
                  ),
                  Text("OR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Cera Pro"
                  ),),
                  SizedBox(
                    width: 145,
                    child: Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color:Color(0xffE2E2E2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/metaMask.png",width: 20,),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "Connect to ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Cera Pro"
                        ),
                      children:[
                        TextSpan(
                           text: "Metamask",
                          style:
                          TextStyle(
                            color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Cera Pro"
                          ),
                        )
                      ]
                    ),
                    )

                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/google.png",width: 20,),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Connect to ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Cera Pro"
                          ),
                          children:[
                            TextSpan(
                              text: "Google",
                              style:
                              TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Cera Pro"
                              ),
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff100F0F),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/apple.png",width: 20,),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Connect to ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Cera Pro"
                          ),
                          children:[
                            TextSpan(
                              text: "Apple",
                              style:
                              TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Cera Pro"
                              ),
                            )
                          ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
