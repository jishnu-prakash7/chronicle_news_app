import 'package:flutter/material.dart';
import 'package:news_app/presentation/blocs/fetch_news_bloc/fetch_news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/views/splash_page/splash_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchNewsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chronicle',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
