class Joke {
  final String id;
  final String text;

  Joke({
    required this.id,
    required this.text,
  });

  Joke copyWith({
    String? id,
    String? text,
  }) {
    return Joke(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      id: map['id'] as String,
      text: map['text'] as String,
    );
  }
}
