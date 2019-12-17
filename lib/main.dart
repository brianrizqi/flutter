import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottom.dart';
import 'signup.dart';
import 'package:flutter_app/services/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/bottom': (BuildContext context) => new BottomPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyHomePageState();

  const MyHomePage({
    Key key,
  }) : super(key: key);
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Builder(
          builder: (context) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                            child: Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                            child: Text(
                              'There',
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: username,
                              decoration: InputDecoration(
                                  labelText: 'EMAIL / USERNAME',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Source-sans Pro',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Source-sans Pro',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
//                          suffixIcon: IconButton(
//                            icon: Icon(
//
//                            ),
//                          )
                              ),
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Container(
                              height: 55.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 5.0,
                                child: GestureDetector(
                                  onTap: () {
                                    login(username, password, context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Source-sans Pro"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Dont Have an account?',
                            style: TextStyle(fontFamily: "Source-sans Pro")),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontFamily: "Source-sans Pro",
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}

void login(username, password, context) {
  var api = Api.api + 'login';
  http.post(api, headers: {
    'Accept': 'application:json',
    "Content-Type": "application/x-www-form-urlencoded"
  }, body: {
    'username': username.text,
    'password': password.text
  }).then((response) {
    var data = json.decode(response.body);
    if (data['error'] == false) {
      Navigator.of(context).pushNamed('/bottom');
    } else {
      _showToast(context);
    }
  });
}

void _showToast(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('Username / Password salah'),
  ));
}
