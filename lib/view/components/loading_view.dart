// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:refyne_demo/constants.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Colors.white.withOpacity(0.5),
        ),
        const SizedBox(height: 20),
        Text(
          kUploadingMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              letterSpacing: 0.5),
        ),
      ],
    );
  }
}
