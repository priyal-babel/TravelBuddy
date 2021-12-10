import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travel_buddy/menu.dart';

import 'DatabaseManager/DatabaseManager.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final _key = GlobalKey<FormState>();

  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  // TextEditingController _to = TextEditingController();

  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};
  List<bool> isSelected = [true, false, false, false, false];
  List<bool> submit = [false];

  void getLocation() async {
    await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 14.5,
      )));
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getLocation();
    });

    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final User? user = auth.currentUser;
    // if (user != null) {
    //   final uid = user.uid;
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Scaffold(
      endDrawer: Menu(Icons.home_outlined, 'Home', () {
        Navigator.pushNamed(context, '/home');
      }),
      appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Constants.darkBlue,
          automaticallyImplyLeading: false),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Form(
          key: _key,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height,
                width: size.width,
                child: GoogleMap(
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(19.134070, 72.8303),
                    zoom: 12.0,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  markers: _markers,
                ),
              ),
              Positioned(
                  top: size.height * 0.05,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Column(
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(Icons.my_location),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: width * 0.8, height: 40),
                                child: Material(
                                  elevation: 10.0,
                                  child: TextFormField(
                                    controller: _from,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter From location';
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.0),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constants.darkBlue,
                                                width: 1)),
                                        hintText: "From..."),
                                  ),
                                ),
                              )
                            ]),
                        Container(
                          width: width * 0.89,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.more_vert_outlined),
                            ],
                          ),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.location_on_outlined,
                                      size: 30)),
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: width * 0.8, height: 40),
                                child: Material(
                                  elevation: 10.0,
                                  child: TextFormField(
                                    controller: _to,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter To location';
                                      } else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.0),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Constants.darkBlue,
                                                width: 1)),
                                        hintText: "To..."),
                                  ),
                                ),
                              )
                            ]),
                      ],
                    ),
                  )),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: width,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ToggleButtons(
                            fillColor: Constants.lightBlue,
                            selectedBorderColor: Constants.darkBlue,
                            renderBorder: false,
                            children: <Widget>[
                              Container(
                                width: width / 6,
                                child: Icon(
                                  Icons.directions_car_outlined,
                                  size: 30,
                                ),
                              ),
                              Container(
                                width: width / 6,
                                child: Icon(
                                  Icons.directions_walk_outlined,
                                  size: 30,
                                ),
                              ),
                              Container(
                                width: width / 6,
                                child: Icon(
                                  Icons.directions_bus_outlined,
                                  size: 30,
                                ),
                              ),
                              Container(
                                width: width / 6,
                                child: Icon(
                                  Icons.directions_bike_outlined,
                                  size: 30,
                                ),
                              ),
                              Container(
                                width: width / 6,
                                child: Icon(
                                  Icons.train_outlined,
                                  size: 30,
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int buttonIndex = 0;
                                    buttonIndex < isSelected.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    isSelected[buttonIndex] = true;
                                  } else {
                                    isSelected[buttonIndex] = false;
                                  }
                                }
                              });
                            },
                            isSelected: isSelected,
                          ),
                          ToggleButtons(
                            children: <Widget>[
                              Container(
                                  width: width / 6 - 2,
                                  child: Icon(Icons.navigate_next_outlined))
                            ],
                            onPressed: (int index) {
                              Navigator.pushNamed(context, '/availability');
                              int ind = 0;
                              for (int i = 0; i < isSelected.length; i++) {
                                if (isSelected[i] == true) {
                                  ind = i;
                                }
                              }
                              if (_key.currentState!.validate()) {
                                fromtomode(context, ind);
                              }
                            },
                            isSelected: submit,
                          )
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          child: Icon(
            Icons.location_searching,
            color: Colors.white,
          ),
          backgroundColor: Constants.darkBlue,
          onPressed: () {
            getLocation();
          },
        ),
      ),
    );
  }

  Future<void> fromtomode(BuildContext context, int ind) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      await DatabaseManager().details(_from.text, _to.text, ind, uid);
    }
  }
}
