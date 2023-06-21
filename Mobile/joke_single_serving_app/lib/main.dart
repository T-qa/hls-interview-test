import 'package:flutter/material.dart';
import 'package:joke_single_serving_app/views/joke_homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const JokeSingleServingApp());
}

class JokeSingleServingApp extends StatelessWidget {
  const JokeSingleServingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joke App',
      home: JokeHomePage(),
    );
  }
}
