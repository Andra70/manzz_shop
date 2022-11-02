import 'package:flutter/cupertino.dart';

import 'dart:convert';

List<Adbanner> adBannerListFromJson(String val) => List<Adbanner>.from(
  json.decode(val)['data'].map((banner) => Adbanner.fromJson(banner))
  );

class Adbanner {
  final int id;
  final String image;

  Adbanner({
    required this.id,
    required this.image,
  });

  factory Adbanner.fromJson(Map<String, dynamic> data) => Adbanner(
        id: data['id'],
        image: data['attributes']['images']['data']['attributes']['url'],
      );
}
