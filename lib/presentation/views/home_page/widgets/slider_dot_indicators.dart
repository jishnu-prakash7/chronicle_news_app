import 'package:flutter/material.dart';

Row sliderDotIndicators({required int currentIndex}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(5, (index) {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.blueAccent : Colors.grey,
        ),
      );
    }),
  );
}
