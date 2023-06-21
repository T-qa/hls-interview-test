import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:joke_single_serving_app/constants/app_constant.dart';
import 'package:joke_single_serving_app/views/joke_view.dart';

import '../controllers/joke_controller.dart';
import '../models/joke.dart';
import '../models/vote.dart';
import '../services/joke_service.dart';

class JokeHomePage extends StatefulWidget {
  const JokeHomePage({super.key});

  @override
  State<JokeHomePage> createState() => _JokeHomePageState();
}

class _JokeHomePageState extends State<JokeHomePage> {
  final JokeService jokeService = JokeService();
  JokeController? jokeController;

  @override
  void initState() {
    super.initState();
    Hive.openBox<Vote>('votes').then((voteBox) {
      setState(() {
        jokeController = JokeController(voteBox, jokeService);
      });
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            AppConstants.appName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: jokeController?.getNextJoke(),
          builder: (context, AsyncSnapshot<Joke?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for the future
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Show an error message if the future throws an error
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (jokeController != null) {
              final joke = snapshot.data;
              return JokeView(
                jokeController: jokeController!,
                joke: joke,
              );
            } else {
              return const Center(
                child: Text(
                  'Joke controller is null.',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
