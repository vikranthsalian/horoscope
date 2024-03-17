import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

class MetaLocationPicker extends StatefulWidget {
  const MetaLocationPicker({Key? key}) : super(key: key);

  @override
  State<MetaLocationPicker> createState() => _MetaLocationPickerState();
}

class _MetaLocationPickerState extends State<MetaLocationPicker> {
  Prediction? initialValue;
  String YOUR_API_KEY = "AIzaSyAf-4bAnJye1Kthg5bMTnDd9Tzp-myMeMk";
  final TextEditingController _controller = TextEditingController();
  LatLng? _currentPosition;
  Location? location;
  String address = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: MapLocationPicker(
          apiKey: YOUR_API_KEY,
          searchController: _controller,
          hideMapTypeButton: true,
          hideLocationButton: true,
          hideBottomCard: true,
          onDecodeAddress: (GeocodingResult? value, Location? loc) {
            print(value!.formattedAddress);
            //  address = value.formattedAddress ?? "";
            _controller.text = value.formattedAddress ?? "";
            location = loc;
            print(loc);
            // setState(() {});
          },
          hasLocationPermission: true,
          popOnNextButtonTaped: true,
          currentLatLng: _currentPosition,
          onSuggestionSelected: (PlacesDetailsResponse? result) {
            print(result);
            if (result != null) {
              setState(() {
                address = result.result.formattedAddress ?? "";
                _controller.text = address;
              });
            }
          },
          onNext: (GeocodingResult? result) {
            print(result);
            if (result != null) {
              setState(() {
                address = result.formattedAddress ?? "";
              });
            }
          },
        ),
      ),
    );
  }
}
