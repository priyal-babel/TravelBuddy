import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'constants.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  @override
  _UserDetails createState() => _UserDetails();
}

class Album {
  final double latitude;
  final double longitude;

  Album({
    required this.latitude,
    required this.longitude,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://us1.locationiq.com/v1/search.php?key=pk.7216c6700adb5f292e5108df4ccb47b6&q=Royal Classic Andheri West Mumbai India&format=json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _UserDetails extends State<UserDetails> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    print(futureAlbum);
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(child: Text('Hi')
        // height: size.height,
        // width: double.infinity,
        // child: Positioned(
        //     child: FutureBuilder<Album>(
        //   future: futureAlbum,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       // return Text(snapshot.data);
        //       print(snapshot.data);
        //       return Text('0');
        //     } else if (snapshot.hasError) {
        //       // return Text('${snapshot.error}');
        //     }

        //     // By default, show a loading spinner.
        //     return const CircularProgressIndicator();
        //   },
        // ))
        );
  }
}
