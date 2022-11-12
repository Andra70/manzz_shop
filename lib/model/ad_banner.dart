import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<Adbanner> adBannerListFromJson(String val) => List<Adbanner>.from(
  json.decode(val)['data'].map((banner) => Adbanner.fromJson(banner))
  );

@HiveType(typeId: 1)
class Adbanner {
  @HiveField(0)
  final int id;
  @HiveField(1)
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
