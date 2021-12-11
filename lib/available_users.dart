import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_buddy/home.dart';
import 'package:travel_buddy/userDetails.dart';
import 'constants.dart';
import 'menu.dart';

List users = [];
int itemCount = 0;

class Available extends StatefulWidget {
  final List availableUser;
  final String from;
  final String to;

  Available(this.availableUser, this.from, this.to);

  @override
  _AvailableState createState() =>
      _AvailableState(this.availableUser, this.from, this.to);
}

Widget customListTile(BuildContext context, int index, String from, String to) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    child: Material(
      color: Colors.white,
      elevation: 10,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.darkBlue, width: 1)),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.175,
          width: MediaQuery.of(context).size.height * 0.9,
          child: Row(children: <Widget>[
            Container(
              // color: Colors.black,
              width: MediaQuery.of(context).size.height * 0.16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image(
                          image: NetworkImage(users[index]['profileurl']),
                          height: 105,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(users[index]['fname'] + " " + users[index]['lname'],
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Student at ' + users[index]['college'],
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(from, style: TextStyle(color: Colors.grey[600])),
                        Icon(
                          Icons.east_outlined,
                          color: Colors.grey[600],
                        ),
                        Text(
                          to,
                          style: TextStyle(color: Colors.grey[600]),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          width: 60,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserDetails(users[index]))),
                              style: ElevatedButton.styleFrom(
                                primary: Constants.lightBlue,
                                onPrimary: Colors.black,
                                side: BorderSide(
                                  width: 1.0,
                                  color: (Constants.darkBlue),
                                ),
                              ),
                              child: Text(
                                'Details',
                                style: TextStyle(fontSize: 8),
                              )),
                        ),
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    ),
  );
}

class _AvailableState extends State<Available> {
  final List availableUser;
  final String from;
  final String to;

  _AvailableState(this.availableUser, this.from, this.to);

  void fetchUsers() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    for (int i = 0; i < availableUser.length; i++) {
      if (user != null) {
        if (user.uid != availableUser[i]) {
          var id = availableUser[i].toString();
          FirebaseFirestore.instance
              .collection("profileInfo")
              .doc(id)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              print('Document data: ${documentSnapshot.data()}');
              users.add(documentSnapshot.data());
              setState(() {
                itemCount = itemCount + 1;
              });
            } else {
              print('Document does not exist on the database');
            }
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return MaterialApp(
      color: Colors.white,
      home: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          endDrawer: Menu(),
          appBar: AppBar(
              title: Text('Available users',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Constants.darkBlue),
          body: itemCount > 0
              ? ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return customListTile(context, index, from, to);
                  },
                )
              : Center(child: Text('No users available.')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final FirebaseAuth auth = FirebaseAuth.instance;
              final User? user = auth.currentUser;
              final collection =
                  FirebaseFirestore.instance.collection('traveldetails');
              if (user != null) {
                collection
                    .doc(user.uid) // <-- Doc ID to be deleted.
                    .delete() // <-- Delete
                    .then((_) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          content: Text("Journey cancelled."),
                          actions: [
                            new TextButton(
                              child: const Text("OK"),
                              onPressed: () => {
                                Navigator.pop(context),
                                Navigator.of(context).pushAndRemoveUntil(
                                    new MaterialPageRoute(
                                        builder: (context) => new Home()),
                                    (route) => false)
                              },
                            ),
                          ],
                        );
                      });
                }).catchError((error) => print('Delete failed: $error'));
              }
              // Add your onPressed code here!
            },
            label: const Text('Cancel'),
            icon: const Icon(Icons.cancel_outlined),
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
