import 'dart:convert';
import 'package:theme_with_getx/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

String url = "https://restcountries.com/v3.1/all?fields=name,flags";

class NetworkApiService extends BaseApiService {
  @override
  Future<void> get() async {
    dynamic jsonResponse;

    http.Response res = await http.get(Uri.parse(url)).timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        // ignore: null_argument_to_non_null_type
        return Future.value();
      },
    );
    jsonResponse = jsonOutput(res);

    return jsonResponse;
  }

  dynamic jsonOutput(http.Response res) {
    switch (res.statusCode) {
      case 200:
        List<dynamic> jsonList = json.decode(res.body);
        return jsonList;

      default:
        throw Exception();
    }
  }
}
