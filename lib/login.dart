import 'dart:io';

import 'forgetpass.dart';
import 'package:email_validator/email_validator.dart';
import 'home.dart';
import 'package:flutter/material.dart';
//import 'package:login_ui_design/signup_screen.dart';
import 'choose.dart';
import 'SignUpScreen.dart';
import 'modules/http.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

 String response = "";
  bool _emailIsValid = false;

  loginUser() async {
    var result = await http_post("login-user", {
      "email": emailController.text,
      "password": passController.text,
    });
    if (result.ok) {
      setState(() {
        response = result.data['status'];
      });
     showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text('User created successfully'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      //  Navigator.push(
      //        context,
      //        MaterialPageRoute(
      //           builder: (context) => home(),
      //    ));
      emailController.clear();
      passController.clear();
    }
    else
    {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('failed'),
          content: Text('fffff'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(100)),
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
                      margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                      child: TextFormField(
                        controller: emailController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffEEEEEE),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 100,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextFormField(
                        controller: passController,
                        cursorColor: Color(0xFF0E712C),
                        decoration: InputDecoration(
                          focusColor: Color(0xFF0E712C),
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color(0xFF0E712C),
                          ),
                          hintText: "Enter Password",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Write Click Listener Code Here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => forgetpass(),
                              ));
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Color(0xFF0E712C)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here.
                        if (_formKey.currentState!.validate()) {
                          loginUser();
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => home(),
                        //     ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 54,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                (new Color(0xFF0E712C)),
                                new Color(0xFF0E712C)
                              ],
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
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have Any Account?  "),
                          GestureDetector(
                            child: Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Color(0xFF0E712C)),
                            ),
                            onTap: () {
                              // Write Tap Code Here.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
