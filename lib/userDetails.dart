import 'package:flutter/material.dart';
import 'package:travel_buddy/constants.dart';
import 'package:travel_buddy/menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatefulWidget {
  var userData;
  UserDetails(this.userData);

  @override
  _UserDetails createState() => _UserDetails(this.userData);
}

String getTime(var time) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy'); //your date format here
  var date = time.toDate();
  return formatter.format(date);
}

class _UserDetails extends State<UserDetails> {
  var userData;
  _UserDetails(this.userData);

  @override
  Widget build(BuildContext context) {
    String gender = "Female";
    String number = "8976514635";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Menu(),
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('User details',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Constants.darkBlue),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: SingleChildScrollView(
          child: Stack(
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
                    backgroundImage: NetworkImage(userData['profileurl']),
                    backgroundColor: Colors.transparent,
                  )),
              Positioned(
                  top: size.height * 0.22,
                  left: size.width * 0.2,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.6,
                    child: Text(
                      userData['fname'] + ' ' + userData['lname'],
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
                      userData['college'],
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
                      Text(userData['email'])
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
                      Text(userData['phone'])
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
                                getTime(userData['dob']),
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
                                child: userData['gender'] == "Female"
                                    ? Icon(Icons.female_outlined)
                                    : Icon(Icons.male_outlined),
                              ),
                              Text(userData['gender'] == 'Female'
                                  ? "Female"
                                  : "Male")
                            ],
                          ),
                        ),
                      ])),
              Positioned(
                  top: size.height * 0.58,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.1,
                        right: size.width * 0.1,
                        top: 10),
                    child: Container(
                      width: size.width * 0.8,
                      child: Align(
                          alignment: Alignment.center,
                          child: Image(image: NetworkImage(userData['idurl']))),
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
                backgroundColor: Constants.darkBlue,
                onPressed: () async {
                  await launch("tel://+91" + userData['phone']);
                },
                child: Icon(Icons.phone_outlined)),
          ),
          FloatingActionButton(
              backgroundColor: Color(0xff12bb18),
              onPressed: () async {
                await launch(
                    'https://wa.me/91${userData['phone']}?text=Hey%20buddy,%20Found%20your%20contact%20on%20TravelBuddy.%20Let\'s%20travel%20together...');
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
