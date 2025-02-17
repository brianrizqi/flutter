import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/home.dart';
import 'package:flutter_app/fragments/plant.dart';
import 'package:flutter_app/fragments/profile.dart';

void main() => runApp(new BottomPage());

class BottomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BottomPageState();
}

class BottomPageState extends State<BottomPage> {
  int _currentIndex = 0;

  Widget fragment(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Plant();
        break;
      case 2:
        return Profile();
        break;
      default:
        return Home();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: fragment(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? Icon(
                        Icons.home,
                        color: Colors.green,
                      )
                    : Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontFamily: 'Source-sans Pro',
                      fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? Icon(
                        Icons.favorite,
                        color: Colors.green,
                      )
                    : Icon(Icons.favorite),
                title: Text(
                  'Plant',
                  style: TextStyle(
                      fontFamily: 'Source-sans Pro',
                      fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? Icon(
                        Icons.person,
                        color: Colors.green,
                      )
                    : Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'Source-sans Pro',
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
