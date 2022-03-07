// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../constants.dart';

class InitialView extends StatelessWidget {
  final Function onTap;

  InitialView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => onTap(),
          child: Container(
            height: 80,
            width: 80,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white.withOpacity(0.5),
              size: 40,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.04)),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          kInitialMessage,
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
