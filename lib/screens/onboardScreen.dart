import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocerry/screens/signupScreen.dart';

class Onboardscreen extends StatelessWidget {
  const Onboardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/onboard.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 500,
                  child: Image.asset('assets/images/onboard_logo.png'),
                ),
                Positioned(
                  bottom: 250,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "  Welcome\nto our store",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 230,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Get your groceries in as fast as one hour",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 150,
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Signupscreen()),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
