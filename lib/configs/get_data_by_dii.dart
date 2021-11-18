import 'dart:convert';

import 'package:http/http.dart' as http;

String BaseUrl = "https://a221.net/jsonapi/";


Future getDataByDii({required String url}) async {
  return http.get(Uri.parse(BaseUrl + url)).then((value) => json.decode(value.body));
}