
import '../models/joke.dart';
import '../models/vote.dart';
import '../services/joke_service.dart';

class JokeController {
  final JokeService _jokeService = JokeService();
  List<Joke> _jokes = [];
  int _currentJokeIndex = 0;
  Joke? _currentJoke;

  Future<void> fetchJokes() async {
    _jokes = await _jokeService.getJokes();
    _currentJokeIndex = 0;
  }

  Joke? getCurrentJoke() {
    if (_jokes.isEmpty || _currentJokeIndex >= _jokes.length) {
      return null;
    }
    return _jokes[_currentJokeIndex];
  }

  void showNextJoke() {
    if (_currentJokeIndex < _jokes.length - 1) {
      _currentJokeIndex++;
    }
  }

  void likeJoke() {
    if (_currentJokeIndex < _jokes.length) {
      final Joke currentJoke = _jokes[_currentJokeIndex];
      final Vote vote = Vote(jokeId: currentJoke.id, isLiked: true);
      _jokeService.recordVote(vote);

      if (_currentJokeIndex == _jokes.length - 1) {
        _currentJokeIndex++;
        // Set currentJoke to null to indicate no more jokes
        _currentJoke = null;
      }
    }
  }

  void dislikeJoke() {
      if (_currentJokeIndex < _jokes.length) {
      final Joke currentJoke = _jokes[_currentJokeIndex];
      final Vote vote = Vote(jokeId: currentJoke.id, isLiked: false);
      _jokeService.recordVote(vote);

      if (_currentJokeIndex == _jokes.length - 1) {
        _currentJokeIndex++;
        // Set currentJoke to null to indicate no more jokes
        _currentJoke = null;
      }
    }
  }
}