
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers: <Widget> [
          SliverAppBar(
            backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
          Text('Cars Rental' , 
          style: TextStyle(color: Color(0xFF0E712C)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 120, 10),
        ),
        Icon(Icons.notifications,
        color:Color(0xFF0E712C) ,
        )
        ],) 
          ),
          




          
        ],),

/*
return Scaffold(
  //1
  body: CustomScrollView(
    slivers: <Widget>[
      //2
      SliverAppBar(
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Goa', textScaleFactor: 1),
          background: Image.asset(
            'assets/images/beach.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      //3
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return ListTile(
              leading: Container(
                  padding: EdgeInsets.all(8),
                  width: 100,
                  child: Placeholder()),
              title: Text('Place ${index + 1}', textScaleFactor: 2),
            );
          },
          childCount: 20,
        ),
      ),
    ],
  ),





      body: Center(
        child: Text(
          'Welcome to the Home UI',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),


  */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),


      
    );
  }
}
