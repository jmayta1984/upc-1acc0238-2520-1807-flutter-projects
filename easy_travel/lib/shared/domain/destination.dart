class Destination {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final bool isFavorite;

  const Destination({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    this.isFavorite = false
  });

  Destination copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? overview,
    bool? isFavorite,
  }) {
    return Destination(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
    };
  }

  factory Destination.toDomain(Map<String, dynamic> map) {
    return Destination(
      id: map['id'],
      title: map['title'],
      posterPath: map['poster_path'],
      overview: map['overview'],
    );
  }
}
