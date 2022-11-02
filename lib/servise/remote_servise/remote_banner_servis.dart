import 'package:http/http.dart' as http;
import 'package:manzz_shop/const.dart';

class remoteBannerServise {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banners';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=images'));
    
    return response;
  }
}
