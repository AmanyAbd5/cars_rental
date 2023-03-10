import 'login.dart';
import 'package:flutter/material.dart';
import 'choose.dart';

//  fit: BoxFit.contain,
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
        image: 'images/page1.png',
        title: 'Welcome to our Rental Cars App!',
        description:
            'The easiest way to book your next rental car. Explore more, worry less.'),
    OnboardingItem(
        image: 'images/page2.jpg',
        title: 'Book a rental car in just a few clicks',
        description: 'Easy car rental at your fingertips .'),
    OnboardingItem(
        image: 'images/page3.jpg',
        title: 'Get started now',
        description: 'Discover new destinations with ease.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 254, 255, 254)
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        _onboardingItems[index].image,
                        fit: BoxFit.contain,
                        width: 400, // add width property
                        height: 350, // add height property
                      ),
                      SizedBox(height: 35),
                      Text(
                        _onboardingItems[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E712C),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0E712C),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          _onboardingItems[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _currentPageIndex != 0
                    ? GestureDetector(
                        onTap: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: 
                        Icon(Icons.arrow_back,
                            size: 30, color: Color(0xFF0E712C)),
                            
                      )
                    : SizedBox(),
                _currentPageIndex != _onboardingItems.length - 1
                    ? GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Icon(Icons.arrow_forward,
                            size: 30, color: Color(0xFF0E712C)),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    choose()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0E712C),
                          fixedSize: Size(120, 40), // Specify the button's size
                        ),
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            fontSize: 15, // added to make text bigger
                          ),
                        ),
                      )
              ],
            ),
            SizedBox(
              width: 90,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  String image;
  String title;
  String description;

  OnboardingItem(
      {required this.image, required this.title, required this.description});
}
