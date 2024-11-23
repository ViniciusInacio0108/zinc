import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class JobMapLocation extends StatelessWidget {
  final LatLng initialCenter;
  final double? width;
  final double? height;

  const JobMapLocation({
    Key? key,
    required this.initialCenter,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: width ?? 200,
        height: height ?? 200,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: 14,
            maxZoom: 17,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              maxNativeZoom: 19,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: initialCenter,
                  child: const Icon(
                    Icons.location_on,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
