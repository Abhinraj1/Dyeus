import 'package:flutter/material.dart';

title(String title){
  return
    Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(title,
          textAlign: TextAlign.left,
           style: const TextStyle(
             color: Colors.black,
             fontSize: 28,
             fontWeight: FontWeight.w600,
             fontFamily: "Lora",

           ),

        ),
      );
}