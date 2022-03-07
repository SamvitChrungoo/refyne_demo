// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:refyne_demo/constants.dart';

class ErrorView extends StatelessWidget {
  final String? errorMessage;
  final Function onTap;

  ErrorView({this.errorMessage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              letterSpacing: 0.5),
        ),
        const SizedBox(height: 40),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => onTap(),
          child: Text(
            kReset,
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white.withOpacity(0.5),
                fontSize: 16,
                letterSpacing: 0.5),
          ),
        ),
      ],
    );
  }
}
