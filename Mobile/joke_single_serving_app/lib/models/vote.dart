class Vote {
  final int jokeId;
  final bool isLiked;

  Vote({
    required this.jokeId,
    required this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return {'jokeId': jokeId, 'isLiked': isLiked ? 1 : 0};
  }
}
