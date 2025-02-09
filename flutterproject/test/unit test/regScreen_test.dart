import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen//regScreen.dart';

void main() {
  testWidgets('RegScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RegScreen(),
    ));

    // Verify that the gradient background is displayed
    expect(find.byType(Container), findsOneWidget);

    // Verify that the title is displayed
    expect(find.text('Start Your Journey Today\n Create Your Account'),
        findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(4));

    // Verify that the sign in button is displayed
    expect(find.byType(TextButton), findsOneWidget);

    // Verify that the sign up text is displayed
    expect(find.text('Sign in'), findsOneWidget);
  });
}
