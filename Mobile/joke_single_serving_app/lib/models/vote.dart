import 'package:hive/hive.dart';

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

class VoteAdapter extends TypeAdapter<Vote> {
  @override
  final typeId = 1;

  @override
  Vote read(BinaryReader reader) {
    final jokeId = reader.readString();
    final isLiked = reader.readBool();
    return Vote(jokeId: jokeId, isLiked: isLiked);
  }

  @override
  void write(BinaryWriter writer, Vote vote) {
    writer.writeString(vote.jokeId);
    writer.writeBool(vote.isLiked);
  }
}
