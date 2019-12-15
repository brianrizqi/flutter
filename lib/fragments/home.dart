import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/services/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List dataJSON;
  var api = Api.api + "article";

  Future<String> getArticle() async {
    http.Response result = await http
        .get(Uri.encodeFull(api), headers: {"Accept": "application/json"});

    this.setState(() {
      var data = json.decode(result.body);
      dataJSON = data['data'];
//      print("jsonresponse : $data");
      return data['message'];
    });
  }

  @override
  void initState() {
    this.getArticle();
  }


  @override
  Widget build(BuildContext context) {
    const morning = Color(0xFFc0eae6);
    const afternoon = Color(0xFFf9ed6a);
    const night = Color(0xFF284b69);
    DateTime now = DateTime.now();
    var formattedDate = int.parse(DateFormat('kk').format(now));
    if (formattedDate >= 0 && formattedDate < 12) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: morning,
//        systemNavigationBarColor: morning,
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ));
    } else if (formattedDate >= 12 && formattedDate < 18) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: afternoon,
        systemNavigationBarColor: afternoon, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ));
    } else if (formattedDate >= 18 && formattedDate < 24) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: night,
//        systemNavigationBarColor: night, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ));
    }
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(),
            Container(
              child: Stack(
                children: <Widget>[
                  TextGreeting(formattedDate, morning, afternoon, night)
                ],
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[ImageGreeting(formattedDate)],
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'Article',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  child: new ListView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    itemCount: dataJSON == null ? 0 : dataJSON.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return new Artikel(
                          "http://brian.onestep.id/storage/" +
                              dataJSON[i]['img'],
                          dataJSON[i]['title']);
                    },
//                    children: <Widget>[
//                      new Artikel(
//                        "https://st2.depositphotos.com/1006318/5909/v/950/depositphotos_59095529-stock-illustration-profile-icon-male-avatar.jpg",
//                        api,
//                      ),
//                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageGreeting extends StatelessWidget {
  ImageGreeting(this.formattedDate);

  var formattedDate;

  @override
  Widget build(BuildContext context) {
    if (formattedDate >= 0 && formattedDate < 12) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/morning.png'),
                fit: BoxFit.fill)),
        height: 130,
      );
    } else if (formattedDate >= 12 && formattedDate < 18) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/afternoon.png'),
                fit: BoxFit.fill)),
        height: 130,
      );
    } else if (formattedDate >= 18 && formattedDate < 24) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/night.png'),
                fit: BoxFit.fill)),
        height: 130,
      );
    }
  }
}

class TextGreeting extends StatelessWidget {
  TextGreeting(this.formattedDate, this.morning, this.afternoon, this.night);

  var formattedDate;
  var morning;
  var afternoon;
  var night;

  @override
  Widget build(BuildContext context) {
    if (formattedDate >= 0 && formattedDate < 12) {
      return Container(
        padding: EdgeInsets.only(top: 35.0),
        color: morning,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Selamat Pagi',
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Source-sans Pro'),
        ),
      );
    } else if (formattedDate >= 12 && formattedDate < 18) {
      return Container(
        padding: EdgeInsets.only(top: 35.0),
        color: afternoon,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Selamat Siang',
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Source-sans Pro'),
        ),
      );
    } else if (formattedDate >= 18 && formattedDate < 24) {
      return Container(
        padding: EdgeInsets.only(top: 35.0),
        color: night,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Selamat Malam',
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Source-sans Pro'),
        ),
      );
    }
  }
}

class Artikel extends StatelessWidget {
  Artikel(this.gambar, this.judul);

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: new Column(
        children: <Widget>[
          new Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: NetworkImage(gambar),
                        width: 80,
                        height: 80,
                      ),
                      Flexible(
                        child: new RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: judul,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 1,
          )
        ],
      ),
    );
  }
}
