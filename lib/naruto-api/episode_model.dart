class Episode {
  final String title;
  final String description;
  final String airDate;

  Episode(
      {required this.title, required this.description, required this.airDate});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      title: json['title'],
      description: json['description'],
      airDate: json['air_date'],
    );
  }
}
