import 'dart:convert';

class Movie {
  final String name;
  final String picUrl;
  final String trailerUrl;
  final double rate;
  final String type;
  final int time;
  final int views;
  final List<String> cast;
  final String description;
  final List<DateTime> showTime;
  final int price;

  Movie({
    required this.name,
    required this.picUrl,
    required this.trailerUrl,
    required this.rate,
    required this.type,
    required this.time,
    required this.views,
    required this.cast,
    required this.description,
    required this.showTime,
    required this.price,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['name'],
      picUrl: map['picUrl'],
      trailerUrl: map['trailerUrl'],
      rate: map['rate'],
      type: map['type'],
      time: map['time'],
      views: map['views'],
      cast: List<String>.from(map['cast']),
      description: map['description'],
      showTime: List<DateTime>.from(map['showTime'].map((x) => DateTime.parse(x))),
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picUrl': picUrl,
      'trailerUrl': trailerUrl,
      'rate': rate,
      'type': type,
      'time': time,
      'views': views,
      'cast': cast,
      'description': description,
      'showTime': showTime.map((x) => x.toIso8601String()).toList(),
      'price': price,
    };
  }
}

String movieToJson(Movie movie) {
  return json.encode(movie.toMap());
}

Movie movieFromJson(String source) {
  return Movie.fromMap(json.decode(source));
}