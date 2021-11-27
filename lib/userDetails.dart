import 'package:flutter/material.dart';
import 'package:travel_buddy/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetails createState() => _UserDetails();
}

class _UserDetails extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    String gender = "Female";
    String number = "8976514635";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('USER DETAILS',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Constants.darkBlue),
      body: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            height: size.height,
          )),
          Positioned(
            child: Container(
                alignment: Alignment.center,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Constants.darkBlue)),
          ),
          Positioned(
            top: size.height * 0.125,
            left: size.width * 0.1,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              elevation: 8,
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.8,
                height: size.height * 0.25,
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: size.width * 0.3,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('images/priyal.jpg'),
                backgroundColor: Colors.transparent,
              )),
          Positioned(
              top: size.height * 0.22,
              left: size.width * 0.2,
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.6,
                child: Text(
                  'Priyal Babel',
                  style: TextStyle(fontSize: 24, color: Colors.grey[700]),
                ),
              )),
          Positioned(
              top: size.height * 0.28,
              left: size.width * 0.12,
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.76,
                child: Text(
                  'Student at K. J. Somaiya College of Engineering',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              )),
          Positioned(
              top: size.height * 0.425,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1, right: size.width * 0.05),
                    child: Icon(Icons.email_outlined),
                  ),
                  Text('priyal.babel@somaiya.edu')
                ],
              )),
          Positioned(
              top: size.height * 0.475,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1,
                        right: size.width * 0.05,
                        top: 5),
                    child: Icon(Icons.phone_outlined),
                  ),
                  Text('8976514635')
                ],
              )),
          Positioned(
              top: size.height * 0.54,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.45,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.1,
                              right: size.width * 0.05,
                            ),
                            child: Icon(Icons.today_outlined),
                          ),
                          Text(
                            '28/05/2001',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                            ),
                            child: gender == "Female"
                                ? Icon(Icons.female_outlined)
                                : Icon(Icons.male_outlined),
                          ),
                          Text(gender == 'Female' ? "Female" : "Male")
                        ],
                      ),
                    ),
                  ])),
          Positioned(
              top: size.height * 0.58,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.1, right: size.width * 0.1, top: 10),
                child: Container(
                  width: size.width * 0.8,
                  child: Align(
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('images/IDcard.jpeg'))),
                ),
              )),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
                backgroundColor: Constants.darkBlue,
                onPressed: () async {
                  await launch("tel://+918976514635");
                },
                child: Icon(Icons.phone_outlined)),
          ),
          FloatingActionButton(
              backgroundColor: Color(0xff12bb18),
              onPressed: () async {
                await launch(
                    'https://wa.me/91${number}?text=Hey%20buddy,%20I\'m%20Priyal%20Babel.%20Found%20your%20contact%20on%20TravelBuddy.%20Let\'s%20travel%20together...');
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/whatsapp.jpg'),
                backgroundColor: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
