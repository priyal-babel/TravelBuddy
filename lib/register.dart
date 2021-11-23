import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'package:image_picker/image_picker.dart';
import 'Services/AuthenticationService.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
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
            backgroundColor: Constants.darkBlue),
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
  final AuthenticationService _auth = AuthenticationService();
  final _key = GlobalKey<FormState>();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _branchController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  var profileImageFile;
  var idImageFile;

  _openGallery(BuildContext context1, int num) async {
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (num == 1) {
      this.setState(() {
        profileImageFile = File(picture!.path);
        uploadImage(profileImageFile);
      });
    } else {
      idImageFile = File(picture!.path);
    }
    Navigator.of(context).pop();
  }

  Future uploadImage(var profileImageFile) async {
    final _storage = FirebaseStorage.instance;
    if (profileImageFile != null) {
      var snapshot = await _storage
          .ref()
          .child("folderNane/imageName")
          .putFile(profileImageFile);
      var download = snapshot.ref.getDownloadURL();
      setState(() {
        var imageURL = download;
      });
    }
  }

  _openCamera(BuildContext context, int num) async {
    XFile? picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (num == 1) {
      this.setState(() {
        profileImageFile = File(picture!.path);
      });
    } else {
      idImageFile = File(picture!.path);
    }
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialogue(
      BuildContext context, String title, int num) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take photo'),
                    onTap: () {
                      _openCamera(context, num);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Choose from gallery'),
                    onTap: () {
                      _openGallery(context, num);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

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

  Widget _decideProfileView(BuildContext context, int num) {
    if (num == 1) {
      if (profileImageFile == null) {
        return Text('Upload profile picture',
            style: TextStyle(color: Colors.grey[700]));
      } else {
        return Image.file(
          profileImageFile,
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 120,
        );
      }
    } else if (num == 2) {
      if (idImageFile == null) {
        return Text('Upload college ID',
            style: TextStyle(color: Colors.grey[700]));
      } else {
        return Image.file(
          idImageFile,
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 120,
        );
      }
    } else {
      return Text('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: new SingleChildScrollView(
            child: Form(
                key: _key,
                child: new Column(children: <Widget>[
                  Positioned(
                    top: 100,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          top: 15,
                          right: size.width * 0.05),
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
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 12),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            controller: _fnameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                      )),
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 20, bottom: 12, top: 10),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            controller: _lnameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 12),
                    child: Material(
                      elevation: 10,
                      child: TextFormField(
                        style: TextStyle(height: 1, fontSize: 15),
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.darkBlue, width: 2)),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 12, left: 20, right: 20, bottom: 12),
                      child: Material(
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Constants.darkBlue, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                  style: TextStyle(height: 1, fontSize: 15),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]'))
                                  ],
                                  controller: _phone,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone number cannot be empty';
                                    } else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Phone number',
                                      icon: Icon(Icons.phone_iphone))),
                            ),
                          ))),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            top: 9, left: 20, right: 12, bottom: 12),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            controller: _genderController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Gender cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Gender',
                            ),
                          ),
                        ),
                      )),
                      Flexible(
                        child: new Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 20, bottom: 12, top: 9),
                          child: Material(
                              elevation: 10,
                              child: InputDecorator(
                                // controller: _dobController,
                                decoration: InputDecoration(
                                  labelText: 'Date of Birth',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Constants.darkBlue, width: 2)),
                                ),
                                child: Container(
                                  height: 16,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      new Spacer(),
                                      InkWell(
                                          onTap: () => _selectDate(context),
                                          child:
                                              Icon(Icons.expand_more_outlined))
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: 15,
                        right: size.width * 0.05),
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
                    padding: EdgeInsets.only(
                        top: 12, left: 22, right: 22, bottom: 12),
                    child: Material(
                      elevation: 10,
                      child: TextFormField(
                        style: TextStyle(height: 1, fontSize: 15),
                        controller: _collegeController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'College cannot be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.darkBlue, width: 2)),
                          labelText: 'Name of College',
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            top: 9, left: 22, right: 12, bottom: 12),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            controller: _branchController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Branch cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Branch/Degree',
                            ),
                          ),
                        ),
                      )),
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 22, bottom: 12, top: 9),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            controller: _yearController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Year cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Year',
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Material(
                          elevation: 10,
                          child: Container(
                            height: 150,
                            width: size.width / 2 - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Constants.darkBlue, width: 2)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 120,
                                    alignment: Alignment.center,
                                    child: _decideProfileView(context, 1)),
                                InkWell(
                                  onTap: () {
                                    _showChoiceDialogue(
                                        context, 'Upload profile picture', 1);
                                  },
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    color: Constants.darkBlue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 10,
                          child: Container(
                            height: 150,
                            width: size.width / 2 - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Constants.darkBlue, width: 2)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 120,
                                    alignment: Alignment.center,
                                    child: _decideProfileView(context, 2)),
                                InkWell(
                                  onTap: () {
                                    _showChoiceDialogue(
                                        context, 'Upload college ID', 2);
                                  },
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    color: Constants.darkBlue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: 15,
                        right: size.width * 0.05),
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
                    padding: EdgeInsets.only(
                        top: 12, left: 20, right: 20, bottom: 12),
                    child: Material(
                      elevation: 10,
                      child: TextFormField(
                        maxLines: 3,
                        controller: _bioController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Constants.darkBlue, width: 2)),
                          hintText: 'Enter Bio for Profile',
                        ),
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        top: 15,
                        right: size.width * 0.05),
                    child: Container(
                      width: size.width * 0.9,
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "Password Details",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 12),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            obscureText: true,
                            controller: _passwordController1,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      )),
                      Flexible(
                          child: new Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 20, bottom: 12, top: 10),
                        child: Material(
                          elevation: 10,
                          child: TextFormField(
                            style: TextStyle(height: 1, fontSize: 15),
                            obscureText: true,
                            controller: _passwordController2,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              if (value != _passwordController1.text) {
                                return 'Passwords do not match';
                              }
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.darkBlue, width: 2)),
                              labelText: 'Confirm password',
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 22),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        primary: Constants.darkBlue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          createUser();
                        }
                      },
                      child: Text("SIGN UP",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0))
                ]))));
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _fnameController.text,
        _lnameController.text,
        _emailController.text,
        _phone.text,
        _genderController.text,
        _collegeController.text,
        _branchController.text,
        _passwordController1.text,
        _yearController.text,
        _bioController.text);
    // dynamic result = await _auth.createNewUser(
    //     _emailController.text, _passwordController.text);

    if (result == null) {
      print(result);
    } else {
      print(result.toString());
      _fnameController.clear();
      _lnameController.clear();
      _passwordController1.clear();
      _passwordController2.clear();
      _emailController.clear();
      _phone.clear();
      _genderController.clear();
      _dobController.clear();
      _collegeController.clear();
      _branchController.clear();
      _yearController.clear();
      _bioController.clear();
      // Navigator.of(context).pushReplacementNamed('/login');
      // Navigator.pushNamed(context, '/login');
    }
  }
}
