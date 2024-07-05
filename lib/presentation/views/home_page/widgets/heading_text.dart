import 'package:flutter/material.dart';
import 'package:news_app/config/constants/app_color.dart';

Padding headingText({required String heading}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Text(
      heading,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 19,color: kTeal),
    ),
  );
}
