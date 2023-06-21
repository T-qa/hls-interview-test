import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joke_single_serving_app/constants/app_constant.dart';

import '../controllers/joke_controller.dart';
import '../models/joke.dart';

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
        joke != null
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
                        joke!.text,
                        style: TextStyle(fontSize: 15.sp),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 60.h,
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
                          SizedBox(width: 30.w),
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
                      onPressed: () {},
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
