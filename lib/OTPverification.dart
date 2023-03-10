import 'dart:io';

import 'package:betakati_app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import 'package:login_ui_design/signup_screen.dart';

import 'home.dart';

class OTPverification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<OTPverification> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            color: Color.fromARGB(255, 148, 182, 221),
            gradient: LinearGradient(
              colors: [Color(0xFF0E712C), Color(0xFF0E712C)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Image.asset(
                  "images/vlogo.png",
                  height: 190,
                  width: 200,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.bottomRight,
              )
            ],
          )),
        ),
        Container(
          margin: EdgeInsets.symmetric( vertical: 30),
        //  alignment: Alignment.centerRight,
            child: Text(
              "OTP Verification",
              style: TextStyle(color: Colors.black,
              fontSize: 30),
              
            ),
          
        ),

        Container(
          margin: EdgeInsets.fromLTRB(20,50, 20, 10),
          
          //alignment: Alignment.center,
          
            child: Text(
              "Please enter the verification code here we just sent you on email",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15),
            ),
          
        ),


        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              //const SizedBox(height: 5.0),
              OtpTextField(
                numberOfFields: 4,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) => print("OTP is ==> $code"),
                //keyboardType: TextInputType.number,
              ),

            ],
          )
          ,
        ),
        


        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50, 5),
         // alignment: Alignment.centerRight,
            child: Text(
              "Haven't received the verification code?",
              style: TextStyle(color: Colors.black),
            ),
          
        ),



        Container(
        //  margin: EdgeInsets.symmetric( vertical: 0),
        //  alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Write Click Listener Code Here
             
            },
            child: Text(
              "Resend",
              style: TextStyle(color: Color(0xFF0E712C)),
            ),
          ),
        ),



        GestureDetector(
          onTap: () {
            // Write Click Listener Code Here.
             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => home(),
                      ));
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(new Color(0xFF0E712C)), new Color(0xFF0E712C)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: Text(
              "Verity",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        






      ],
    )));
  }
}






/*
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

*/
       

