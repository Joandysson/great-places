import 'package:flutter/material.dart';
import 'package:great_places/screens/place_detail.dart';
import 'package:great_places/screens/place_form.dart';
import 'package:great_places/utils/app_routes.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.PLACE_FORM: (ctx) => PlaceForm(),
  AppRoutes.PLACE_DETAIL: (ctx) => PlaceDetail(),
};
