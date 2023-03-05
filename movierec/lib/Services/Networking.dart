import 'package:flutter_application/Model/Movies_Api.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

//class{
final endpoint =
    "https://api.themoviedb.org/3/trending/all/day?api_key=389b8a0210ce66880d4f3b0127b4b9ae";

//Trending
Future getData() async {
  var response = await Http.get(Uri.parse(endpoint));

  print((jsonDecode(response.body))["results"]);
  List responseBody = jsonDecode(response.body)["results"];
  List<Movie_Api> results = [];
  responseBody.forEach((movie) => results.add(Movie_Api.fromJson(movie)));

  return results;
}

Future getIndian() async {
  var response = await Http.get(Uri.parse(
      "https://api.themoviedb.org/3/discover/movie?api_key=389b8a0210ce66880d4f3b0127b4b9ae&region=IN&language=hi-IN&release_date.gte=2017-08-01&with_release_type=3|2&with_original_language=hi"));

  print((jsonDecode(response.body))["results"]);
  List responseBody = jsonDecode(response.body)["results"] as List;
  List<Movie_Api> results = [];
  responseBody.forEach((movie) => results.add(Movie_Api.fromJson(movie)));
  print(results[0].title);
  return results;
}

Future getCrime() async {
  var response = await Http.get(Uri.parse(
      "https://api.themoviedb.org/3/discover/movie?api_key=389b8a0210ce66880d4f3b0127b4b9ae&region=IN&language=hi-IN&release_date.gte=2017-08-01&with_release_type=3|2&with_original_language=hi"));

  print((jsonDecode(response.body))["results"]);
  List responseBody = jsonDecode(response.body)["results"] as List;
  List<Movie_Api> results = [];
  responseBody.forEach((movie) => results.add(Movie_Api.fromJson(movie)));
  print(results[0].title);
  return results;
}

Future getTop() async {
  var response = await Http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=389b8a0210ce66880d4f3b0127b4b9ae&language=en-US&page=1"));

  print((jsonDecode(response.body))["results"]);
  List responseBody = jsonDecode(response.body)["results"] as List;
  List<Movie_Api> results = [];
  responseBody.forEach((movie) => results.add(Movie_Api.fromJson(movie)));
  print(results[0].title);
  return results;
}
//getData();
