import 'package:flutter/material.dart';
import 'package:travel_buddy/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/rendering.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetails createState() => _UserDetails();
}

class _UserDetails extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('USER DETAILS',
                style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Constants.darkBlue),
        body: new SingleChildScrollView(
            child: Row(children: <Widget>[
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: <Widget>[
                Positioned(
                    child: Container(
                  width: size.width,
                  height: size.height / 3.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('images/map.png'), fit: BoxFit.fill),
                  ),
                )),
                Positioned(
                    top: size.width / 3,
                    left: 20,
                    child: Container(
                      width: size.width / 2.5,
                      height: size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage('images/pinaki.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                Positioned(
                  top: size.width / 1.75,
                  left: size.width / 2,
                  child: new Text(
                    "Pinaki Jayakar".toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                    top: size.width / 1.6,
                    left: size.width / 2,
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.instagramSquare,
                          color: Colors.pink,
                        ),
                        onPressed: () {})),
                Positioned(
                    top: size.width / 1.6,
                    left: size.width / 1.7,
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blue[800],
                        ),
                        onPressed: () {})),
                Positioned(
                    top: size.width / 1.6,
                    left: size.width / 1.5,
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.whatsappSquare,
                          color: Colors.green,
                        ),
                        onPressed: () {})),
                Positioned(
                    top: size.width / 1.6,
                    left: size.width / 1.35,
                    child: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.twitterSquare,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {})),
                Positioned(
                  top: size.height / 2.1,
                  left: 12,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: size.width,
                        margin: const EdgeInsets.only(),
                        child: new Text(
                          "Student at KJ Somaiya College of Engineering",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                      )
                    ],
                  ),
                ),
              ])
        ])),
      ),
    );
  }
}
