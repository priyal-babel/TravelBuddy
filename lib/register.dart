import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatelessWidget {
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
        body: Register(),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String istapped = 'UPLOAD ID';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: new SingleChildScrollView(
            child: new Column(children: <Widget>[
      Positioned(
        top: 100,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, top: 15, right: size.width * 0.05),
          child: Container(
            width: size.width * 0.9,
            alignment: Alignment.centerLeft,
            child: new Text(
              "Personal Information",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 12),
            child: Material(
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Constants.darkBlue, width: 2)),
                  labelText: 'First Name',
                ),
              ),
            ),
          )),
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(left: 5, right: 20, bottom: 12, top: 10),
            child: Material(
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff61c0c4), width: 2)),
                  labelText: 'Last Name',
                ),
              ),
            ),
          ))
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
        child: Material(
          elevation: 10,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
              labelText: 'Email',
            ),
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 9, left: 20, right: 12, bottom: 12),
            child: Material(
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff61c0c4), width: 2)),
                  labelText: 'Gender',
                ),
              ),
            ),
          )),
          Flexible(
            child: new Padding(
              padding: EdgeInsets.only(left: 5, right: 20, bottom: 12, top: 9),
              child: Material(
                  elevation: 10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xff61c0c4), width: 2)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("${selectedDate.toLocal()}".split(' ')[0]),
                        ),
                        new Spacer(),
                        InkWell(
                            onTap: () => _selectDate(context),
                            child: Icon(Icons.expand_more_outlined))
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.05, top: 15, right: size.width * 0.05),
        child: Container(
          width: size.width * 0.9,
          alignment: Alignment.centerLeft,
          child: new Text(
            "College Detail",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
        child: Material(
          elevation: 10,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
              labelText: 'Name of College',
            ),
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(top: 9, left: 22, right: 12, bottom: 12),
            child: Material(
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff61c0c4), width: 2)),
                  labelText: 'Branch/Degree',
                ),
              ),
            ),
          )),
          Flexible(
              child: new Padding(
            padding: EdgeInsets.only(left: 5, right: 22, bottom: 12, top: 9),
            child: Material(
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff61c0c4), width: 2)),
                  labelText: 'Year',
                ),
              ),
            ),
          ))
        ],
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          primary: Color(0xff61c0c4),
          onPrimary: Colors.white,
        ),
        onPressed: () {},
        child: Text("UPLOAD ID", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.05, top: 15, right: size.width * 0.05),
        child: Container(
          width: size.width * 0.9,
          alignment: Alignment.centerLeft,
          child: new Text(
            "Bio Info",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Container(
          child: new Padding(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
        child: Material(
          elevation: 10,
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff61c0c4), width: 2)),
              hintText: 'Enter Bio for Profile',
            ),
          ),
        ),
      )),
      Padding(
        padding: EdgeInsets.only(top: 12, bottom: 22),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            primary: Color(0xff61c0c4),
            onPrimary: Colors.white,
          ),
          onPressed: () {},
          child: Text("SIGN UP", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      Padding(padding: EdgeInsets.all(8.0))
    ])));
  }
}
