import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class Map extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  Map({
    this.initialLocation = const PlaceLocation(
      latitude: 37.4221,
      longitude: 122.0841,
    ),
    this.isReadOnly = false,
  });

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  LatLng _pickerPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickerPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickerPosition == null
                  ? null
                  : () => Navigator.of(context).pop(_pickerPosition),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: (_pickerPosition == null && !widget.isReadOnly)
            ? const {}
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position:
                      _pickerPosition ?? widget.initialLocation.toLatLng(),
                ),
              },
      ),
    );
  }
}
