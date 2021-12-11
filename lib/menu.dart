import 'package:flutter/material.dart';
import 'login.dart';
import 'constants.dart';
import 'Services/AuthenticationService.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  CustomListTile(this.icon, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Icon(icon),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}

class Menu extends StatelessWidget {
  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Constants.lightBlue, Constants.darkBlue])),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Image.asset(
                        'images/logo.png',
                        height: 100,
                        width: 100,
                      ))
                ],
              ),
            ),
          ),
          CustomListTile(Icons.person_outlined, 'Profile', () {}),
          CustomListTile(Icons.logout_outlined, 'Sign Out', () async {
            await _auth.signOut().then((result) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Success',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Text("User logged out successfully."),
                      actions: [
                        new TextButton(
                          child: const Text("OK"),
                          onPressed: () => {
                            Navigator.pop(context),
                            Navigator.of(context).pushAndRemoveUntil(
                                new MaterialPageRoute(
                                    builder: (context) => new Login()),
                                (route) => false)
                          },
                        ),
                      ],
                    );
                  });
            });
            // Navigator.pushNamed(context, '/login');
          }),
        ],
      ),
    );
  }
}
