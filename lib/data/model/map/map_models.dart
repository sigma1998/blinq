// Package imports:
import 'package:equatable/equatable.dart';

class PlaceModel extends Equatable {
  final String placeId;
  final String placeName;

  final double lon;
  final double lat;

  const PlaceModel({
    this.placeId = '',
    this.placeName = '',
    required this.lon,
    required this.lat,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['place_id'],
      placeName: json['formatted_address'],
      lon: json['geometry']['location']['lng'],
      lat: json['geometry']['location']['lat'],
    );
  }

  @override
  List<Object?> get props => [placeId, placeName, lon, lat];
}

class PlaceAutoComplete {
  String? description;
  String? placeId;

  PlaceAutoComplete({required this.description, required this.placeId});

  PlaceAutoComplete.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    description = json['description'];
  }
}
