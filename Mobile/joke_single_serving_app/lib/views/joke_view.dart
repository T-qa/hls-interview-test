import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke_single_serving_app/constants/app_constant.dart';

import '../controllers/joke_controller.dart';
import '../models/joke.dart';

class JokeView extends StatefulWidget {
  const JokeView({
    Key? key,
  }) : super(key: key);

  @override
  State<JokeView> createState() => _JokeViewState();
}

class _JokeViewState extends State<JokeView> {
  final JokeController _jokeController = JokeController();
  Joke? _currentJoke;

  @override
  void initState() {
    super.initState();
    _fetchJokes();
  }

  Future<void> _fetchJokes() async {
    await _jokeController.fetchJokes();
    setState(() {
      _currentJoke = _jokeController.getCurrentJoke();
    });
  }

  void _likeJoke() {
    _jokeController.likeJoke();
    _showNextJoke();
  }

  void _dislikeJoke() {
    _jokeController.dislikeJoke();
    _showNextJoke();
  }

  void _showNextJoke() {
    _jokeController.showNextJoke();
    setState(() {
      _currentJoke = _jokeController.getCurrentJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set the screen size properties using ScreenUtil
    ScreenUtil.init(context,
        designSize: const Size(375, 825),
        minTextAdapt: true // Provide your design size
        );

    return Column(
      children: [
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: const BoxDecoration(color: AppConstants.green),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'A joke a day keeps the doctor away',
                style: TextStyle(
                  color: AppConstants.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'If you joke wrong way, your teeth have to pay. (Serious)',
                style: TextStyle(
                  color: AppConstants.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        _currentJoke != null
            ? Container(
                height: 430.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 30.h,
                      ),
                      width: 350.w,
                      child: Text(
                        _currentJoke!.text,
                        style: TextStyle(fontSize: 15.sp),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 30.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _likeJoke,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstants.blue),
                              child: const Text('This is Funny!'),
                            ),
                          ),
                          SizedBox(width: 30.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _dislikeJoke,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstants.green),
                              child: const Text('This is not Funny.'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 430.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 30.h,
                      ),
                      width: 350.w,
                      child: Text(
                        AppConstants.allJokesMessageDisplayed,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _fetchJokes,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                      child: const Text('Read again'),
                    ),
                  ],
                ),
              ),
        const Divider(thickness: 1),
        Container(
          height: 130.h,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Text(
                AppConstants.copyRightMessage,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Copyright 2021 HLS',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
