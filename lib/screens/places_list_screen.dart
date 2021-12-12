import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/places_provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<PlacesProvider>(
            context,
            listen: false,
          ).fetchAndSetPlaces(),
          builder: (context, placeSnapshot) {
            return placeSnapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<PlacesProvider>(
                    child: const Center(
                      child: Text('Got no places yet, start adding some!'),
                    ),
                    builder: (ctx, placesProvider, ch) =>
                        placesProvider.items.isEmpty
                            ? ch!
                            : ListView.builder(
                                itemCount: placesProvider.items.length,
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                      placesProvider.items[i].image,
                                    ),
                                  ),
                                  title: Text(placesProvider.items[i].title),
                                  onTap: () {
                                    // Go to detail page ...
                                  },
                                ),
                              ),
                  );
          }),
    );
  }
}
