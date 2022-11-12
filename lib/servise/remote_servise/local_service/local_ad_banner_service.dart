import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:manzz_shop/model/ad_banner.dart';

class LocalAdBannerService {
  late Box<Adbanner> _adBannerBox;

  Future<void> init() async {
    _adBannerBox = await Hive.openBox<Adbanner>('AdBanners');
  }

  Future<void> assignAllAdBanners({required List<Adbanner> adBanners}) async {
    await _adBannerBox.clear();
    await _adBannerBox.addAll(adBanners);
  }

  List<Adbanner> getAllAdBanners() => _adBannerBox.values.toList();

  getAdBanners() {}
}
