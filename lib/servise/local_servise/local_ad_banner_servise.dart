import 'package:hive/hive.dart';
import 'package:manzz_shop/model/ad_banner.dart';

class LocalAdBannerService {
  late Box<Adbanner> _adBannerBox;

  Future<void> init() async {
    _adBannerBox = await Hive.openBox<Adbanner>('adBannerBox');
  }

  Future<void> assignAllAdBannerList({required List<Adbanner> adBanner}) async {
    await _adBannerBox.clear();
    await _adBannerBox.addAll(adBanner);
  }

  List<Adbanner> getAdBanner() => _adBannerBox.values.toList();
}