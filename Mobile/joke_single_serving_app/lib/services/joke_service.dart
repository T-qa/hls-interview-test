import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/joke.dart';
import '../models/vote.dart';

class JokeService {
  Future<List<Joke>> getJokes() async {
    final Database database = await _openDatabase();
    final List<Map<String, dynamic>> jokeMaps = await database.query('jokes');
    await _closeDatabase(database);
    return jokeMaps.map((jokeMap) => Joke.fromMap(jokeMap)).toList();
  }

  Future<void> recordVote(Vote vote) async {
    final Database database = await _openDatabase();
    await database.insert('votes', vote.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    await _closeDatabase(database);
  }

  Future<Database> _openDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'joke_database.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE jokes (
          id INTEGER PRIMARY KEY,
          text TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE votes (
          jokeId INTEGER PRIMARY KEY,
          isLiked INTEGER
        )
      ''');
      // Insert initial jokes here
      final List<Joke> initialJokes = [
        Joke(
          id: 1,
          text:
              'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."\n\nThe child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."\n\nThe child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."',
        ),
        Joke(
          id: 2,
          text:
              'Teacher: "Kids, what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"',
        ),
        Joke(
          id: 3,
          text:
              'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\'"',
        ),
        Joke(
          id: 4,
          text:
              'A housewife, an accountant, and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it\'s either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"',
        ),
      ];
      for (final joke in initialJokes) {
        await db.insert('jokes', joke.toMap());
      }
    });
  }

  Future<void> _closeDatabase(Database database) async {
    await database.close();
  }
}
