import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'portal.dart';
import 'userpro.dart';

void main() {
  runApp(HackerHub2P0());
}

class HackerHub2P0 extends StatelessWidget {
  HackerHub2P0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String logger = "Initializing portal...";
  bool eyeGlw = false;
  int count = 0;
  Timer? blinkTimer;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void blinker() {
    blinkTimer = Timer.periodic(Duration(milliseconds: 100), (time) {
      count++;
      setState(() {
        eyeGlw = !eyeGlw;
      });
      count == logger.length
          ? [
              blinkTimer!.cancel(),
              count = 0,
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, _, __) => Portal()))
            ]
          : null;
    });
  }

  List<String> drawOption = ["Home", "Contact", "About", "Support"];

  @override
  Widget build(BuildContext context) {
    Size homeSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.blue.withOpacity(0.1),
        width: homeSize.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hacker Hub 2.0",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      background: Paint()
                        ..color = Colors.blue.withOpacity(0.3)
                        ..strokeWidth = 15
                        ..style = PaintingStyle.stroke)),
              SizedBox(height: 30.0),
              for (var i = 0; i < 4; i++)
                Container(
                  width: 200,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                      child: Text(drawOption[i],
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(homeSize.width),
                  ),
                  child:
                      Icon(Icons.arrow_back_ios, color: Colors.white, size: 21),
                ),
              ),
            ]),
      ),
      body: Container(
          width: homeSize.width,
          height: homeSize.height,
          child: Stack(children: <Widget>[
            Align(
                child: Container(
              width: homeSize.width,
              height: homeSize.height,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/homescreen.jpg"),
              ),
            )),
            Align(
              alignment: Alignment(-0.16, -0.2),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  // eye 1 glow
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: eyeGlw ? Colors.white : null,
                    borderRadius: BorderRadius.circular(homeSize.width),
                  )),
            ),
            Align(
              alignment: Alignment(0.18, -0.2),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  // eye 2 glow
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: eyeGlw ? Colors.white : null,
                    borderRadius: BorderRadius.circular(homeSize.width),
                  )),
            ),
            Align(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 0.0,
                ),
                child: SizedBox(
                  width: homeSize.width,
                  height: homeSize.height,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () =>
                                    scaffoldKey.currentState!.openDrawer(),
                                child: Icon(Icons.shield,
                                    size: 25, color: Colors.white)),
                            Text("Hacker Hub 2.0",
                                style: TextStyle(
                                    color: Colors.white,
                                    background: Paint()
                                      ..color = Colors.pinkAccent
                                      ..strokeWidth = 15
                                      ..style = PaintingStyle.stroke,
                                    fontSize: 16)),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, _, __) =>
                                          UserPro())),
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(homeSize.width),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/usrpc.jpeg")),
                                  )),
                            ),
                          ]),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment(0.0, 0.7),
              child: GestureDetector(
                onTap: blinker,
                child: Container(
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Center(
                        child: Text("Enter",
                            style: TextStyle(color: Colors.white)))),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.2),
              child: Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: Text(logger.substring(0, count),
                          style:
                              TextStyle(color: Colors.white, fontSize: 16)))),
            ),
          ])),
    );
  }
}
