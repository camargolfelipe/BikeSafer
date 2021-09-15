import 'dart:async';
import 'dart:math';
import 'package:bikesafer/helper/preferences.dart';
import 'package:bikesafer/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

List<LatLng> latlng = [];
List<LatLng> teste = [
  LatLng(-23.223701, -45.9009074),
  LatLng(-23.0263900, -45.5552800),
];

CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(-23.223701, -45.9009074),
  zoom: 13.0,
);

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  var location = Location();
  var attLat = Location()
      .onLocationChanged
      .listen((LocationData currentLocation) => currentLocation.latitude);
  var attLong = Location()
      .onLocationChanged
      .listen((LocationData currentLocation) => currentLocation.longitude);

  Set<Polyline> _polyline = {
    Polyline(
      polylineId: PolylineId(latlng.isEmpty
          ? LatLng(-23.223701, -45.9009074).toString()
          : latlng.first.toString()),
      visible: true,
      points: latlng,
      color: thirdColor,
      width: 2,
    )
  };

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId(LatLng(-23.223701, -45.9009074).toString()),
      position: latlng.isEmpty ? LatLng(-23.223701, -45.9009074) : latlng.first,
      rotation: 9.0,
      draggable: true,
      infoWindow: InfoWindow(
        title: 'Seu ponto final.',
        snippet: latlng.isEmpty
            ? ""
            : distanceInKmBetweenEarthCoordinates(
                latlng.first.latitude,
                latlng.first.longitude,
                latlng.last.latitude,
                latlng.last.longitude),
      ),
      icon: BitmapDescriptor.defaultMarker,
    )
  };
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    Timer timer;
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 2),
        (Timer t) =>
            location.onLocationChanged.listen((LocationData currentLocation) {
              setState(() {
                latlng.add(LatLng(double.parse('${currentLocation.latitude}'),
                    double.parse('${currentLocation.longitude}')));
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: _goToTheLake,
        child: Icon(FontAwesomeIcons.mapMarker),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              simpleRoute(context, '/home');
            },
            icon: Icon(FontAwesomeIcons.home, color: white)),
      ),
      body: Stack(children: [
        GoogleMap(
          polylines: _polyline,
          markers: _markers,
          mapType: MapType.satellite,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: latlng.isEmpty
                ? Text("nope")
                : Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(color: black.withOpacity(0.7)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: latlng.length,
                          itemBuilder: (context, i) {
                            return Text(
                              latlng[i].toString(),
                              style: TextStyle(
                                  color: thirdColor,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                    ),
                  ))
      ]),
    );
  }

  Future<void> _goToTheLake() async {
    Location location = new Location();
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
  }
}

degreesToRadians(degrees) {
  return degrees * pi / 180;
}

distanceInKmBetweenEarthCoordinates(lat1, lon1, lat2, lon2) {
  var earthRadiusKm = 6371;

  var dLat = degreesToRadians(lat2 - lat1);
  var dLon = degreesToRadians(lon2 - lon1);

  lat1 = degreesToRadians(lat1);
  lat2 = degreesToRadians(lat2);

  var a = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
  var c = 2 * atan2(sqrt(a), sqrt(1 - a));
  var last = (earthRadiusKm * c).toStringAsFixed(2);
  return last + " km";
}
