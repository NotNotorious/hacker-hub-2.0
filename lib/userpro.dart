import 'package:flutter/material.dart';

class UserPro extends StatelessWidget {
  UserPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size usrProSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(children: <Widget>[
            Icon(Icons.person, size: 25, color: Colors.black),
            SizedBox(width: 10.0),
            Text("User Hacker",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
      body: Container(
        width: usrProSize.width,
        height: usrProSize.height,
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: usrProSize.width,
                height: 300,
                child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/images/usrpc.jpeg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: usrProSize.width,
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Stats",
                        style:
                            TextStyle(fontSize: 21, color: Colors.greenAccent)),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Table(
                          border: TableBorder.all(color: Colors.white),
                          children: <TableRow>[
                            for (var i = 0; i < 4; i++)
                              TableRow(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Exp",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("$i",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                              ])
                          ]),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(usrProSize.width),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back_ios,
                              size: 21, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
