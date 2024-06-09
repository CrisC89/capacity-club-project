import 'dart:async';

import 'package:capacity_club_mobile_app/domain-features/contact/widget/coach_info_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();
  bool _isMapLoaded = false;
  String? _mapStyle;
  BitmapDescriptor? _customMarker;

  final LatLng _center = const LatLng(50.5469,
      5.8036); // Location of Rue Alphonse Collette 19, 4910 Theux, Belgique
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _setCustomMarker();
  }

  Future<void> _loadMapStyle() async {
    try {
      final String style =
          await rootBundle.loadString('assets/map/map_style.json');
      setState(() {
        _mapStyle = style;
      });
    } catch (e) {
      print('Error loading map style: $e');
    }
  }

  Future<void> _setCustomMarker() async {
    try {
      final BitmapDescriptor bitmapDescriptor =
          await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(100, 100)),
        'assets/img/logo_v2_icon.png',
      );
      setState(() {
        _customMarker = bitmapDescriptor;
        _addMarker();
      });
    } catch (e) {
      print('Error setting custom marker: $e');
    }
  }

  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('location_marker'),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Rue Alphonse Collette 19',
            snippet: '4910 Theux, Belgique',
          ),
          icon: _customMarker ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });
  }

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'coach@example.com',
      query: 'subject=Contact&body=Hello Coach',
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      print('Could not launch $emailLaunchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'MOVE CONCEPT',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Text(
              'Rue Alphonse Collette 19,\n4910 Theux,\nBelgique',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 15,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    rotateGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    mapType: MapType.normal,
                    style:
                        _mapStyle, // Utilisation de la nouvelle méthode pour appliquer le style
                  ),
                  if (!_isMapLoaded)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            CoachInfoCard(
              name: 'Jehan LECARME',
              description: 'COACH / PRÉPARATION PHYSIQUE / CROSSFIT / HALTÉRO',
              imageUrl: 'assets/img/jl_logo.png',
              email: 'jehan.lecarme@example.com',
              phoneNumber: '+123456789',
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
    setState(() {
      _isMapLoaded = true;
    });
  }
}
