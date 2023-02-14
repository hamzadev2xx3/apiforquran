import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:adhan/adhan.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PrayerScreen> {
  Location location = new Location();
  LocationData? _currentPosition;
  double? latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Prayer Timings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: getLoc(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(2, 241, 2, 78)));
            }
            final myCoordinates = Coordinates(longitude!, latitude!);
            final params = CalculationMethod.karachi.getParameters();
            params.madhab = Madhab.hanafi;
            final prayerTimes = PrayerTimes.today(myCoordinates, params);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fajr',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.fajr),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sunrise',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.sunrise),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duhur',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.dhuhr),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Asr',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.asr),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maghrib',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.maghrib),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Isha',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.jm().format(prayerTimes.isha),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ) // Text
                      ],
                    ), // Row
                  ),
                ],
              ),
            );
          }),
    ));
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    latitude = 24.8607; //24.8607° N, 67.0011° E
    longitude = 67.0011;
  }
}
