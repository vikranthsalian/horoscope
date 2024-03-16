import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtils {
  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      MetaAlert.showErrorAlert(message: "Please Enable Location!");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print("Geolocator.requestPermission()");
      print(permission);
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        determinePosition();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      // showDialog(
      //     context: globalContext,
      //     barrierDismissible: false,
      //     builder: (_) => MetaLocationErrorDialog(onPressed: () async {
      //           try {
      //             Position pos = await Geolocator.getCurrentPosition();
      //             return pos;
      //           } catch (e) {
      //             openSetting();
      //           }
      //         }));
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position? pos;
    try {
      print("getCurrentPosition");
      pos = await Geolocator.getCurrentPosition();
      print("getCurrentPosition+");
      print(pos);
    } catch (e) {
      print("getCurrentPosition++++++e");
    }
    return pos;
  }

  Future<String> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print("placemarks");
    print(placemarks);
    Placemark place = placemarks[0];
    //  String address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    String address =
        '${place.street}, ${place.subLocality}, ${place.locality},\n ${place.postalCode}';

    return address;
  }
}
