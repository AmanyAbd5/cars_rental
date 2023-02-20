import 'package:flutter/material.dart';

import 'login.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    //_navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
            //      title: 'amany',
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E712C),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('images/car.png'),
              backgroundColor: Color(0xFF0E712C),
            ),
            Text(
              'Cars Rental',
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                //  backgroundColor: Colors.cyan[100],
              ),
            )
          ],
        ),
      ),
    );
  }
}
