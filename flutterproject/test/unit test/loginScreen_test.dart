import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/loginScreen.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';

void main() {
  testWidgets('loginScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that the gradient background is displayed
    expect(find.byType(Container), findsOneWidget);

    // Verify that the title is displayed
    expect(find.text('Start Your Journey with Us \n Sign in!'), findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(2));

    // Verify that the forgot password text is displayed
    expect(find.text('Forgot Password?'), findsOneWidget);

    // Verify that the sign in button is displayed
    expect(find.byType(TextButton), findsOneWidget);

    // Verify that the sign up text is displayed
    expect(find.text('Sign up'), findsOneWidget);
  });

  testWidgets('loginScreen navigates to Showroom', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Tap on the sign in button
    await tester.tap(find.byType(TextButton));

    // Verify that the Showroom screen is displayed
    expect(find.byType(Showroom), findsOneWidget);
  });
}
