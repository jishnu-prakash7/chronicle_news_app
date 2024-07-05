import 'package:flutter/material.dart';
import 'package:news_app/presentation/views/home_page/home_page.dart';
import 'package:news_app/presentation/views/home_page/widgets/app_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route route) => false);
  }

  @override
  void initState() {
    navigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: appTitle(size: 25),
      ),
    );
  }
}
