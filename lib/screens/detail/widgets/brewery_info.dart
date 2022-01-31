import 'dart:io';

import 'package:beer_app_icapps/base/base_utils.dart';
import 'package:beer_app_icapps/models/web/brewery.dart';
import 'package:flutter/material.dart';

class BreweryInfo extends StatelessWidget {
  const BreweryInfo({
    Key? key,
    required this.brewery,
  }) : super(key: key);

  final Brewery brewery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Brewery", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        Text(brewery.name ?? ""),
        Text(brewery.address ?? ""),
        Text(brewery.city ?? ""),
        Text(brewery.country ?? ""),
        TextButton(
            onPressed: () async {
              // final String appleMapsUrl =
              //     "https://maps.apple.com/?q=${brewery.address?.replaceAll(" ", "+")}+${brewery.city?.replaceAll(" ", "+")}+${brewery.country?.replaceAll(" ", "+")}";
              if (Platform.isIOS) {
                final String appleMapsUrl =
                    "https://maps.apple.com/?q=${brewery.address?.replaceAll(" ", "+")}+${brewery.city?.replaceAll(" ", "+")}+${brewery.country?.replaceAll(" ", "+")}";
                await launchUrl(appleMapsUrl);
              } else {
                final String googleMapsUrl =
                    "https://www.google.com/maps/search/?api=1&query=${brewery.address?.replaceAll(" ", "+")}+${brewery.city?.replaceAll(" ", "+")}+${brewery.country?.replaceAll(" ", "+")}";
                await launchUrl(googleMapsUrl);
              }
            },
            child: const Text("show on map")),
      ],
    );
  }
}
