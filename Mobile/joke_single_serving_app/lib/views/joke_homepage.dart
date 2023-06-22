import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context,
        designSize: const Size(375, 825),
        minTextAdapt: true // Provide your design size
        );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Image.asset(
              'assets/images/logo.png',
              width: 40.w,
              height: 40.h,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Handcrafted by',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Jim HLS',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://cdn.quotesgram.com/img/97/60/1409672537-Smile-Quotes-Graphics-157.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: AppConstants.white,
          elevation: 0,
        ),
        body: const JokeView(),
      ),
    );
  }
}
