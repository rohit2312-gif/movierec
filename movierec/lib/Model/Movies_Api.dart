class Movie_Api {
  String? title;
  int? id;
  String? overview;
  String? url;
  String? name;
  Movie_Api({this.title, this.id, this.overview, this.url, this.name});
  factory Movie_Api.fromJson(Map<String, dynamic> json) {
    return Movie_Api(
        title: json["title"],
        id: json["id"],
        overview: json["overview"],
        url: "https://image.tmdb.org/t/p/w500" + json["poster_path"],
        name: json["name"]);
  }
}
