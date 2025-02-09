import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen//regScreen.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';

void main() {
  testWidgets('Reg screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(RegScreen());

    // Verify that the gradient background is displayed
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(LinearGradient), findsOneWidget);

    // Verify that the welcome text is displayed
    expect(find.text('Start Your Journey Today\n Create Your Account'),
        findsOneWidget);

    // Verify that the form container is displayed
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Padding), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);

    // Verify that the form fields are displayed
    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Phone or Gmail'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Conform Password'), findsOneWidget);

    // Verify that the sign in button is displayed
    expect(find.text('SIGN IN'), findsOneWidget);

    // Verify that the already have an account text is displayed
    expect(find.text('Already have account?'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
  });

  testWidgets('Reg screen handles form input', (WidgetTester tester) async {
    await tester.pumpWidget(RegScreen());

    // Enter values into the form fields
    await tester.enterText(find.byType(TextField).first, 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), 'johndoe@gmail.com');
    await tester.enterText(find.byType(TextField).at(2), 'password123');
    await tester.enterText(find.byType(TextField).last, 'password123');

    // Tap the sign in button
    await tester.tap(find.text('SIGN IN'));

    // Verify that the showroom page is displayed
    expect(find.byType(Showroom), findsOneWidget);
  });
}
