class Review {
  final String userName;
  final int destinationId;
  final String comment;
  final int rating;
  final DateTime date;

  const Review({
    required this.userName,
    required this.destinationId,
    required this.comment,
    required this.rating,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userName: '${json['user']['lastName']}, ${json['user']['firstName']}',
      destinationId: json['destinationId'],
      comment: json['comment'],
      rating: json['rating'],
      date: DateTime.parse(json['date']),
    );
  }
}
