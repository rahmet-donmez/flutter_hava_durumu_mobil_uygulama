import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  //enlem ve boylam bilgileri
  late double latitude; //late ile değişkene daha sonra değer ataması yapılacağı belirtilir
  late double longtude;

  getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

//location için servis ayakta mı?
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location
          .requestService(); //servisin ayağa kalkması için servise istek gönderilir
      if (!_serviceEnabled) {
        return;
      }
    }

//kullanıcı konuma izin verdi mi?
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) //izin verilmemişse
    {
      _permissionGranted = await location.requestPermission(); //izin istenir
      if (_permissionGranted != PermissionStatus.granted) //grated=izin verildi
      {
        return;
      }
    }

//servis ayakta ve konum izni verilmişse
    _locationData = await location.getLocation(); //konum bilgisini alır
//değişkenlere bilgiler atanır
    latitude = _locationData.latitude!;
    longtude = _locationData.longitude!;
  }
}
