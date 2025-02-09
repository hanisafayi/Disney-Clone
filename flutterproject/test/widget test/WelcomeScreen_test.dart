import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/WelcomeScreen.dart';
import 'package:flutterproject/presentation/screen/loginScreen.dart';
import 'package:flutterproject/presentation/screen/regScreen.dart';

void main() {
  testWidgets('WelcomeScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Verify that the gradient background is displayed
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(LinearGradient), findsOneWidget);

    // Verify that the welcome text is displayed
    expect(find.text('Discover Your Journey \nWelcome To Our Car Rental App'),
        findsOneWidget);

    // Verify that the sign in button is displayed
    expect(find.byType(GestureDetector), findsNWidgets(2));
    expect(find.text('SIGN IN'), findsOneWidget);

    // Verify that the sign up button is displayed
    expect(find.text('SIGN UP'), findsOneWidget);
  });

  testWidgets('WelcomeScreen navigates to login screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Tap on the sign in button
    await tester.tap(find.text('SIGN IN'));

    // Verify that the login screen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('WelcomeScreen navigates to registration screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Tap on the sign up button
    await tester.tap(find.text('SIGN UP'));

    // Verify that the registration screen is displayed
    expect(find.byType(RegScreen), findsOneWidget);
  });
}
