import 'package:flutter/material.dart';

subTitle(String subTitle){
  return
    Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          width: 340,
            child: Text(
              subTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Cera Pro",
                fontWeight: FontWeight.w500
              ),

            )),
      ),
    );
}