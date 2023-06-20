import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';

  GeoController() {
    getPosition();
  }

  getPosition() async {
    try {
      Position position = await _actualPosition();
      sendLocation(position);

      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      error = e.toString();
    }

    notifyListeners();
  }

  double setDistance(GeoController location, GeoController otherLocation) {
    return Geolocator.distanceBetween(
        location.lat, location.long, otherLocation.lat, otherLocation.long);
  }

  Future<Position> _actualPosition() async {
    LocationPermission permission;
    bool activated = await Geolocator.isLocationServiceEnabled();
    if (!activated) {
      return Future.error(
          'Por favor, habilite a localização no seu smartphone.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<bool> sendLocation(position) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    String emailFormated =
        currentUser!.email!.substring(0, currentUser.email!.indexOf('@'));
    final ref = FirebaseDatabase.instance.ref("users/${emailFormated}");
    await ref.update({
      "lastKnowLocationLat": position.latitude,
      "lastKnowLocationLong": position.longitude,
    });
    return true;
  }
}
