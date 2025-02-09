import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/loginScreen.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';

void main() {
  testWidgets('loginScreen Widget Test', (WidgetTester tester) async {
    // Build the loginScreen widget
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that the title and necessary input fields are rendered correctly
    expect(find.text('Start Your Journey with Us \n Sign in!'), findsOneWidget);
    expect(find.text('Gmail'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify that tapping on the "SIGN IN" button navigates to the Showroom screen
    await tester.tap(find.text('SIGN IN'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that navigation to the Showroom screen occurred
    expect(find.byType(Showroom), findsOneWidget);
  });
}
