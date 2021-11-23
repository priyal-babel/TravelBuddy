import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'AVAILABLE USERS';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title:
                Text(appTitle, style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Color(0xff61c0c4)),
        body: Available(),
      ),
    );
  }
}

class Available extends StatefulWidget {
  @override
  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  String istapped = 'UPLOAD ID';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: new SingleChildScrollView(
            child: new Column(children: <Widget>[
      Row(children: <Widget>[
        Flexible(
          child: new Padding(
            padding: EdgeInsets.only(top: 22, left: 22, right: 22, bottom: 12),
            child: Container(
                height: size.height / 3.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff61c0c4), width: 2),
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                ),
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 20,
                      child: Container(
                        width: size.width / 4,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('images/pinaki.jpg'),
                              fit: BoxFit.fill),
                        ),
                      )),
                  Positioned(
                    top: size.height * 0.05,
                    left: size.width * 0.33,
                    child: new Text(
                      "Pinaki Jayakar".toUpperCase(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.09,
                    left: size.width * 0.33,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: new Text(
                            "Student at KJ Somaiya College of Engineering",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 5.5,
                    left: size.width * 0.10,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: new Text(
                            "Main Gate",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 5.5,
                    left: size.width * 0.20,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: new Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.black,
                            size: 28.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 5.5,
                    left: size.width * 0.55,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            "Mulund",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 4.5,
                    left: size.width * 0.35,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {},
                            child: Text(
                              'See Details'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height / 4.25,
                    left: size.width * 0.54,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 5.0),
                          child: new Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.grey[700],
                            size: 28.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ])
    ])));
  }
}
