class Joke {
  final int id;
  final String text;

  Joke({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(id: map['id'], text: map['text']);
  }
}
