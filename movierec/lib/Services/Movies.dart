import 'dart:convert';

import 'package:http/http.dart' as Http;

class Player {
  Future<String> fetch(String id) async {
    var response = await Http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${id}/videos?api_key=389b8a0210ce66880d4f3b0127b4b9ae"));

    if (response.statusCode == 200) {
      try {
        String token = jsonDecode(response.body)["results"][0]["key"];
        //   var key=response.body[""]
        return token;
      } catch (e) {
        return '';
      }
      //  return '';
    } else
      return '';

    final endpoint =
        "https://api.themoviedb.org/3/movie/155/videos?api_key=389b8a0210ce66880d4f3b0127b4b9ae";
  }
}
