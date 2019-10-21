class Person {
  String name;
  String avatarURL;

  Person.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromJson(Map<String, dynamic> json): super.fromJson(json);
}

class Director extends Person {
  Director.fromJson(Map<String, dynamic> json): super.fromJson(json);
}

int counter = 1;

class TestItem {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  TestItem.fromJson(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.playDate = json["year"];
    this.rating = json["rating"]["average"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromJson(item);
    }).toList();
    this.director = Director.fromJson(json["directors"][0]);
    this.originalTitle = json["original_title"];
  }
}