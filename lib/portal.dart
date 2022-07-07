import 'package:flutter/material.dart';

import 'portalcard.dart';

class Portal extends StatefulWidget {
  Portal({Key? key}) : super(key: key);

  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  @override
  Widget build(BuildContext context) {
    Size portalSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          leadingWidth: 0,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.black,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(children: <Widget>[
              Icon(Icons.hub, size: 21, color: Colors.pinkAccent),
              SizedBox(width: 10.0),
              Text("Hacker Hub Portal",
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ]),
          )),
      body: Container(
        width: portalSize.width,
        height: portalSize.height,
        child: Stack(children: <Widget>[
          Align(
            child: Container(
              width: portalSize.width,
              height: portalSize.height,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/portalbg.jpeg"),
              ),
            ),
          ),
          Align(
              child: Container(
            padding: EdgeInsets.all(10.0),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(6, (index) {
                  return PortalCard(idx: index);
                })),
          )),
        ]),
      ),
    );
  }
}
