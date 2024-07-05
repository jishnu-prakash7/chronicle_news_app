import 'package:flutter/material.dart';

RichText appTitle({double? size}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'C',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size ?? 20,
            color: Colors.teal,
          ),
        ),
        TextSpan(
          text: 'hronicle.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size ?? 20,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
