import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:joke_single_serving_app/views/joke_homepage.dart';
import 'services/joke_service.dart';
import 'models/joke.dart';
import 'models/vote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JokeAdapter());
  Hive.registerAdapter(VoteAdapter());

  // Open the Hive box for jokes
  await Hive.openBox<Joke>('jokes');

  // Initialize and store initial jokes
  final JokeService jokeService = JokeService();
  await jokeService.storeInitialJokes();

  runApp(const JokeSingleServingApp());
}

class JokeSingleServingApp extends StatelessWidget {
  const JokeSingleServingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JokeHomePage(),
    );
  }
}
