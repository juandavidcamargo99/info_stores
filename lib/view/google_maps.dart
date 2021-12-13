import 'dart:async';
import 'package:flutter/material.dart';
import '../model/store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatelessWidget {
  final Store store;
  GoogleMapsWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: GoogleMapsView(store),
      ),
    );
  }
}

class GoogleMapsView extends StatefulWidget {
  final Store store;
  GoogleMapsView(this.store);

  @override
  State<GoogleMapsView> createState() => GoogleMapsViewState();
}

class GoogleMapsViewState extends State<GoogleMapsView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final CameraPosition _mainCamera = CameraPosition(
      target: LatLng(widget.store.latitud, widget.store.longitud),
      zoom: 18,
    );
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _mainCamera,
        markers: {
          Marker(
              markerId: MarkerId(widget.store.id),
              position: LatLng(widget.store.latitud, widget.store.longitud),
              infoWindow: InfoWindow(title: widget.store.name)),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {}
}