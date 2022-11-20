import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  static getResposne(String url) async {
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        print(response.statusCode);
        return null;
      }
    } on HttpException catch (e) {
      print(e.message);
      return null;
    }
  }
}
