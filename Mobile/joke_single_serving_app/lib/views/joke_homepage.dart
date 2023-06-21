import 'package:flutter/material.dart';
import 'package:joke_single_serving_app/constants/app_constant.dart';
import 'package:joke_single_serving_app/views/joke_view.dart';

class JokeHomePage extends StatefulWidget {
  const JokeHomePage({super.key});

  @override
  State<JokeHomePage> createState() => _JokeHomePageState();
}

class _JokeHomePageState extends State<JokeHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppConstants.appName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppConstants.green,
        ),
        body: const JokeView(),
      ),
    );
  }
}
