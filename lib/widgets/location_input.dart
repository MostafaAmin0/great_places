import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentLocation()async{
    final loactionData= await Location().getLocation();
    print(loactionData.latitude);
    print(loactionData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text('Current Location'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.map,
              ),
              label: const Text('Select on Map'),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
