import 'dart:async';
import 'dart:convert' as convert;

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:geolocator/geolocator.dart' as geo;
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

// Project imports:
import 'package:blinq/data/model/map/map_models.dart';

class LocationService {
  static PermissionStatus _locationPermission = PermissionStatus.granted;

  static PermissionStatus get locationPermission => _locationPermission;

  static final Location _location = Location();

  static geo.Position? myPosition;

  static Future<void> requestPermission() async {
    _locationPermission = await _location.requestPermission();
  }

  static Future<void> requestService() async {
    final serviceEnabled = await _location.requestService();

    if (!serviceEnabled) {
      _locationPermission = PermissionStatus.denied;
    }
  }

  static Future<geo.Position?> determinePosition() async {
    await requestPermission();
    var permission = await _location.hasPermission();
    _locationPermission = permission;

    if (permission == PermissionStatus.granted ||
        permission == PermissionStatus.grantedLimited) {
      var serviceEnabled = await _location.serviceEnabled();

      if (!serviceEnabled) {
        _locationPermission = PermissionStatus.denied;
        return null;
      }

      try {
        myPosition = await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.best,
          timeLimit: const Duration(seconds: 100),
        );

        return myPosition;
      } catch (e) {
        if (e is TimeoutException) {
          return await determinePosition();
        }
        if (e is geo.LocationServiceDisabledException) {
          _locationPermission = PermissionStatus.denied;
        }
      }
    }
    return null;
  }

  static const String key = 'AIzaSyAfbxHPjQ_PlRCzzvKRPqaoc55uh4DNEvQ';

  //'AIzaSyAK7VMIjDJ8ofaBi_KR3or3DB9bjGt8jTs'; old
  static const String types = 'geocode';

  static Future<List<PlaceAutoComplete>> getPlaces(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=$types&key=$key';
    debugPrint(url);
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    debugPrint('WWWW:$json');
    var results = json['predictions'] as List;
    return results.map((place) => PlaceAutoComplete.fromJson(place)).toList();
  }

  static Future<PlaceModel> getPlaceDetails(String id) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    debugPrint('JSON:::: $json');
    var result = json['result'] as Map<String, dynamic>;
    return PlaceModel.fromJson(result);
  }

  static Future<String?> getAddressFromLatLng(double lat, double lng) async {
    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$host?key=$key&language=en&latlng=$lat,$lng';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = convert.jsonDecode(response.body);
      String formattedAddress = data["results"][0]["formatted_address"];
      debugPrint("response ==== $formattedAddress");
      return formattedAddress;
    } else {
      return null;
    }
  }
}
