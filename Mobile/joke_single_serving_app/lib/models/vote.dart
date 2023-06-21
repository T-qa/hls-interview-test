class Vote {
  final String jokeId;
  final bool isLiked;

  Vote({
    required this.jokeId,
    required this.isLiked,
  });

  Vote copyWith({
    String? jokeId,
    bool? isLiked,
  }) {
    return Vote(
      jokeId: jokeId ?? this.jokeId,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jokeId': jokeId,
      'isLiked': isLiked,
    };
  }

  factory Vote.fromMap(Map<String, dynamic> map) {
    return Vote(
      jokeId: map['jokeId'] as String,
      isLiked: map['isLiked'] as bool,
    );
  }
}
