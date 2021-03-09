import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemsCount => _items.length;

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlane = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlane);

    DB.insert('places', {
      'id': newPlane.id,
      'title': newPlane.title,
      'image': newPlane.image.path,
    });

    notifyListeners();
  }
}
