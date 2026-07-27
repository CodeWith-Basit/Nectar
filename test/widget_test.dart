// This is a basic Flutter widget test for the Nectar app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocerry/screens/splash_screen.dart';

void main() {
  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our Splash Screen and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    // Verify that Splash screen renders app title text.
    expect(find.text('Nector'), findsOneWidget);

    // Advance timer to let splash screen transition to onboard screen and settle.
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
