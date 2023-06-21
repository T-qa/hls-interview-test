import 'package:flutter/material.dart';
import 'package:joke_single_serving_app/constants/app_constant.dart';

import '../controllers/joke_controller.dart';
import '../models/joke.dart';

import 'message_view.dart';

class JokeView extends StatelessWidget {
  final JokeController jokeController;
  final Joke? joke;

  const JokeView({
    required this.jokeController,
    super.key,
    required this.joke,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: const BoxDecoration(color: AppConstants.green),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'A joke a day keeps the doctor away',
                style: TextStyle(
                  color: AppConstants.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'If you joke wrong way, your teeth have to pay. (Serious)',
                style: TextStyle(
                  color: AppConstants.white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        joke != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      width: 350,
                      child: Text(
                        joke!.text,
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 60,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  jokeController.recordVote(joke!, true),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstants.blue),
                              child: const Text('This is Funny!'),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  jokeController.recordVote(joke!, false),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstants.green),
                              child: const Text('This is not Funny.'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1),
                    const Text(AppConstants.copyRightMessage,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Copyright 2021 HLS'),
                  ],
                ),
              )
            : const MessageView(AppConstants.allJokesMessageDisplayed),
      ],
    );
  }
}
