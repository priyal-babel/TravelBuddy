import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'SIGNUP';
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
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String istapped = 'UPLOAD ID';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new SingleChildScrollView(
            child: new Column(children: <Widget>[
      Padding(
        padding: new EdgeInsets.only(left: 22, top: 22, right: 179),
        child: new Text(
          "Personal Information",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 22, left: 22, right: 12, bottom: 12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'First Name',
              ),
            ),
          )),
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(left: 5, right: 22, bottom: 12, top: 22),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Last Name',
              ),
            ),
          ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
            labelText: 'Email',
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 9, left: 22, right: 12, bottom: 12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Gender',
              ),
            ),
          )),
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(left: 5, right: 22, bottom: 12, top: 9),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Date of Birth',
              ),
            ),
          ))
        ],
      ),
      Padding(
        padding: new EdgeInsets.only(left: 22, top: 9, right: 240),
        child: new Text(
          "College Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
            labelText: 'Name of College',
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 9, left: 22, right: 12, bottom: 12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Branch',
              ),
            ),
          )),
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(left: 5, right: 22, bottom: 12, top: 9),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Year',
              ),
            ),
          ))
        ],
      ),
      RaisedButton(
        onPressed: () {
          setState(() {
            istapped = 'UPLOAD ID';
          });
        },
        padding: EdgeInsets.all(20),
        textColor: Colors.white,
        color: Color(0xff61c0c4),
        child: new Text("UPLOAD ID",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: new EdgeInsets.only(left: 22, top: 9, right: 300),
        child: new Text(
          "Bio Info",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
          width: 700,
          child: new Padding(
            padding: EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
                labelText: 'Enter Bio for Profile',
              ),
            ),
          )),
      Padding(
        padding: EdgeInsets.only(top: 12, bottom: 22),
        child: RaisedButton(
          onPressed: () {
            setState(() {
              istapped = 'UPLOAD ID';
            });
          },
          padding: EdgeInsets.all(20),
          textColor: Colors.white,
          color: Color(0xff61c0c4),
          child: new Text("UPLOAD ID",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      )
    ])));
  }
}
