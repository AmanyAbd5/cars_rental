import 'dart:io';

import 'package:betakati_app/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:login_ui_design/signup_screen.dart';

import 'home.dart';
import 'OTPverification.dart';


class forgetpass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<forgetpass> {
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
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 150),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            cursorColor: Color(0xFF0E712C),
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Color(0xFF0E712C),
              ),
              hintText: "Enter Email",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        
        
        GestureDetector(
          onTap: () {
            // Write Click Listener Code Here.
             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPverification(),
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
              "Next",
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
       

