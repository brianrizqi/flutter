import 'package:flutter/material.dart';

void main() => runApp(new Bottom());

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class BottomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BottomPageState();
}

class BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
            )
          ],
        ),
      ),
    );
  }
}
