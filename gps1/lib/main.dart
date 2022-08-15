import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentAddress = 'My Address';
  Position? currentposition;

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enable Your Location Service')));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permissions are denied')));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
//-------------------------------------------

  void fnc() async {
    Position pos1 = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> lo1 =
        await placemarkFromCoordinates(pos1.latitude, pos1.longitude);
    
    print(pos1.latitude);
    print(pos1.longitude);
    print(pos1.timestamp);
    print(lo1[0].country);
    print(lo1[0].locality);

  }

  @override
  Widget build(BuildContext context) {
    fnc();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentAddress),
            currentposition != null
                ? Text('Latitude = ' + currentposition!.latitude.toString())
                : Container(),
            currentposition != null
                ? Text('Longitude = ' + currentposition!.longitude.toString())
                : Container(),
            ElevatedButton(
                onPressed: () {
                  _determinePosition();
                },
                child: Text('Locate me'))
          ],
        ),
      ),
    );
  }
}
