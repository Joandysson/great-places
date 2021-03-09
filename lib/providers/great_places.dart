import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/utils/db.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final dataList = await DB.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }

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
