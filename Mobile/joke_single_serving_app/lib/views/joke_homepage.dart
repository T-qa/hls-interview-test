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
          leading: Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.h_mobiledata_outlined,
              size: 40,
              color: Colors.black,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Handcrafted by',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jim HLS',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.quotesgram.com/img/97/60/1409672537-Smile-Quotes-Graphics-157.jpg'),
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
