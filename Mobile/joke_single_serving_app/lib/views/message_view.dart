import 'package:flutter/material.dart';

import '../constants/app_constant.dart';

class MessageView extends StatelessWidget {
  final String message;

  const MessageView(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
