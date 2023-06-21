  import 'package:hive/hive.dart';

  import '../models/joke.dart';
  import '../models/vote.dart';
  import '../services/joke_service.dart';

  class JokeController {
    final Box<Vote> _voteBox;
    final JokeService _jokeService;

    JokeController(this._voteBox, this._jokeService);

    Future<Joke?> getNextJoke() async {
      final List<String> votedJokeIds =
          _voteBox.values.map((vote) => vote.jokeId).toList();
      final List<Joke> allJokes = await _jokeService.getAllJokes();
      final List<Joke> remainingJokes =
          allJokes.where((joke) => !votedJokeIds.contains(joke.id)).toList();
      return remainingJokes.isNotEmpty ? remainingJokes.first : null;
    }

    void recordVote(Joke joke, bool liked) {
      final vote = Vote(jokeId: joke.id, isLiked: liked);
      _voteBox.add(vote);
    }
  }
