import 'package:flutter/material.dart';
import 'package:travel_buddy/userDetails.dart';
import 'constants.dart';
import 'menu.dart';

final int itemCount = 3;

class Available extends StatefulWidget {
  @override
  _AvailableState createState() => _AvailableState();
}

Widget customListTile(BuildContext context, int index) {
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
                          image: AssetImage('images/priyal.jpg'),
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
                    Text('Priyal Babel',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Student at K.J. Somaiya College of Engineering',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Andheri',
                            style: TextStyle(color: Colors.grey[600])),
                        Icon(
                          Icons.east_outlined,
                          color: Colors.grey[600],
                        ),
                        Text(
                          'Somaiya',
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
                                      builder: (context) => UserDetails())),
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
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        endDrawer: Menu(Icons.home_outlined, 'Home', () {
          Navigator.pushNamed(context, '/home');
        }),
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Available users',
                style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Constants.darkBlue),
        body: itemCount > 0
            ? ListView.builder(
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return customListTile(context, index);
                },
              )
            : const Center(child: Text('No available buddies for this route.')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Cancel'),
          icon: const Icon(Icons.cancel_outlined),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
