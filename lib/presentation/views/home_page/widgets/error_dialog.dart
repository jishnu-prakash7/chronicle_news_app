
  import 'package:flutter/material.dart';
import 'package:news_app/presentation/blocs/fetch_news_bloc/fetch_news_bloc.dart';

Future<dynamic> errorDialog(BuildContext context, FetchNewsFailureState state) {
    return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Oops.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "${state.error} try again later.",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
  }