class DestinationDto {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  const DestinationDto({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory DestinationDto.fromJson(Map<String, dynamic> json) {
    return DestinationDto(
      id: json['id'],
      title: json['title'],
      posterPath: json['posterPath'],
      overview: json['overview'],
    );
  }
}
