// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:refyne_demo/constants.dart';

class SuccessView extends StatelessWidget {
  final File image;
  final Function onReset;

  SuccessView({required this.image, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
            height: 140,
            width: 140,
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.04)),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          kSuccessMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              letterSpacing: 0.5),
        ),
        const SizedBox(height: 40),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => onReset(),
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
