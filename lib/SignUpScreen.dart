import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'modules/http.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String response = "";
  bool _emailIsValid = false;

  bool _nameIsValid = false;
  bool _phoneIsValid = false;
  bool _passIsValid = false;

  createUser() async {
    var result = await http_post("create-user", {
      "username": nameController.text,
      "email": emailController.text,
      "phonenumber": phonenController.text,
      "password": passController.text,
    });
    if (result.ok) {
      setState(() {
        response = result.data['status'];
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title:Row(
            children: [
            Text('Success',
            style: TextStyle(color: Color(0xFF0E712C))),
            Container(
            
          margin: EdgeInsets.fromLTRB(50, 10, 80, 10),
        ),
           Icon( Icons.check_box,
           color:Color(0xFF0E712C) ,)
           
        //(0xFF0E712C),
          ]) ,
          content: Text('User created successfully'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK',style: TextStyle(color: Color(0xFF0E712C))),
            ),
          ],
        ),
      );
      nameController.clear();
      emailController.clear();
      phonenController.clear();
      passController.clear();
    }
    // else {
    //     showDialog(
    //     context: context,
    //     builder: (_) => AlertDialog(
    //       title: Text('Failed'),
    //       content: Text('User already exists'),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.pop(context),
    //           child: Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
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
                            BorderRadius.only(bottomLeft: Radius.circular(90)),
                        color: new Color(0xFF0E712C),
                        gradient: LinearGradient(
                          colors: [
                            (new Color(0xFF0E712C)),
                            new Color(0xFF0E712C)
                          ],
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
                        controller: nameController,
                        cursorColor: Color(0xFF0E712C),
                        decoration: InputDecoration(
                          suffixIcon: _nameIsValid
                              ? Icon(
                                  Icons.check_box,
                                  color: Color(0xFF0E712C),
                                )
                              : null,
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF0E712C),
                          ),
                          hintText: "Name",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 3)
                            return 'Name must be more than 2 charater';
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _nameIsValid = (value.length)>2;
                          });
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
                          suffixIcon: _emailIsValid
                              ? Icon(
                                  Icons.check_box,
                                  color: Color(0xFF0E712C),
                                )
                              : null,
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFF0E712C),
                          ),
                          hintText: "Email",
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
                        onChanged: (value) {
                          setState(() {
                            _emailIsValid = EmailValidator.validate(value);
                          });
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
                        keyboardType: TextInputType.phone,
                     
                        controller: phonenController,
                        cursorColor: Color(0xFF0E712C),
                        decoration: InputDecoration(
                          suffixIcon: _phoneIsValid
                              ? Icon(
                                  Icons.check_box,
                                  color: Color(0xFF0E712C),
                                )
                              : null,
                          focusColor: Color(0xFF0E712C),
                          icon: Icon(
                            Icons.phone,
                            color: Color(0xFF0E712C),
                          ),
                          hintText: "Phone Number",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                           if (value.length != 10) {
                            return 'Mobile Number must be of 10 digit';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _phoneIsValid = (value.length)>9;
                          });
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
                          suffixIcon: _passIsValid
                              ? Icon(
                                  Icons.check_box,
                                  color: Color(0xFF0E712C),
                                )
                              : null,
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
                          if (value.length < 6) {
                            return 'Password must be more than 6 charater';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _passIsValid = (value.length)>5;
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here.
                        if (_formKey.currentState!.validate()) {
                          createUser();
                        }
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
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have Already Member?  "),
                          GestureDetector(
                            child: Text(
                              "Login Now",
                              style: TextStyle(color: Color(0xFF0E712C)),
                            ),
                            onTap: () {
                              // Write Tap Code Here.
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}





// _checkEmail() {

//    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);

//    if(emailValid)
//        setState(() {
//            _myIcon=Icons.ok;
//         });
// }