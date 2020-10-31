import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'second_page.dart';

class ThirdPage extends StatefulWidget {
  final String email;

  ThirdPage({Key key, this.email}) : super(key: key);
  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  Future<File> file;
  String base64Image;
  File tmpFile;
  String caption;
  String url;
  String date;
  String email='';

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }


  startUpload() async {
    final StorageReference postImageRef =
        FirebaseStorage.instance.ref().child("Reports");
    var timeKey = new DateTime.now();

    final StorageUploadTask uploadTask =
        postImageRef.child(timeKey.toString() + ".jpg").putFile(await file);

    var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    url = ImageUrl.toString();
    print("Image Url: " + url);
    goToHomePage();
    saveToDatabase(url);
  }

  goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(email);
    }));
  }

  saveToDatabase(url) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "image": url,
      "description": caption,
      "date": date,
      "address": _currentAddress,
    };
    ref.child("Posts").push().set(data);
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          print('inside showimage');
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    chooseImage();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('indeide buider\n');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  caption = value;
                },
                decoration: ktextfield.copyWith(
                    hintText: 'Enter Description Of Event')),
            SizedBox(
              height: 20.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  date = value;
                },
                decoration: ktextfield.copyWith(hintText: 'Enter Drive Date')),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Create Event'),
                  onPressed: startUpload,
                  color: Color(0xFF007ACC),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  onPressed: null,
                  child: Text('Report Issue'),
                  color: Color(0xFF007ACC),
                )
              ],
            ), 
          ],
        ),
      ),
    );
  }
}
