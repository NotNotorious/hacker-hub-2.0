import 'package:flutter/material.dart';

List<Icon> iconOpt = <Icon>[
  Icon(Icons.play_circle_outline, size: 40, color: Colors.white),
  Icon(Icons.search, size: 40, color: Colors.white),
  Icon(Icons.network_check, size: 40, color: Colors.white),
  Icon(Icons.track_changes, size: 40, color: Colors.white),
  Icon(Icons.terminal, size: 40, color: Colors.white),
  Icon(Icons.check, size: 40, color: Colors.white),
];
List<String> prcrdDetail = <String>[
  "Hacker Hub Playground",
  "IP Scanner",
  "Network Analysis",
  "Exp Tracker",
  "Hacker Terminal",
  "Pen Testing"
];

class PortalCard extends StatelessWidget {
  PortalCard({Key? key, required this.idx}) : super(key: key);

  final int idx;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.circle, color: Colors.greenAccent, size: 18),
                Text("Exp-itm-$idx",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ]),
        ),
        SizedBox(height: 20.0),
        Container(
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(5.0),
            child: iconOpt[idx]),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(prcrdDetail[idx],
              style: TextStyle(
                fontSize: 15,
                color: Colors.greenAccent,
              )),
        )
      ]),
    );
  }
}
