import 'package:hive/hive.dart';

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

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final typeId = 0;

  @override
  Joke read(BinaryReader reader) {
    final id = reader.readString();
    final text = reader.readString();
    return Joke(id: id, text: text);
  }

  @override
  void write(BinaryWriter writer, Joke joke) {
    writer.writeString(joke.id);
    writer.writeString(joke.text);
  }
}
