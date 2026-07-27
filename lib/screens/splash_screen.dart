import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocerry/screens/onboard_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute<void>(builder: (context) => const Onboardscreen()));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53B175),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              "Nector",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              "Artisanal Grocery",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Spacer(),
            Icon(
              Icons.eco,
              size: 180,
              color: Colors.white,
            ),
            Spacer(),
            Center(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    letterSpacing: 0.6,
                  ),
                  children: [
                    TextSpan(text: "Created by "),
                    TextSpan(
                      text: "CodeWithBasit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                color: Color(0xff006E2F),
                backgroundColor: Colors.grey[200],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}