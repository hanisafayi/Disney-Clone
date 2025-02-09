import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/payment.dart';

void main() {
  testWidgets('PaymentPage displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PaymentPage(),
    ));

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the payment information text is displayed
    expect(find.text('Enter Payment Information'), findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(4));

    // Verify that the confirm payment button is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('PaymentPage confirms payment', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PaymentPage(),
    ));

    // Enter some dummy data into the text fields
    await tester.enterText(find.byType(TextField).first, '1234 5678 9012 3456');
    await tester.enterText(find.byType(TextField).at(1), '1234 5678 9012 3456');
    await tester.enterText(find.byType(TextField).at(2), '1000');
    await tester.enterText(find.byType(TextField).at(3), 'password');

    // Tap on the confirm payment button
    await tester.tap(find.byType(ElevatedButton));

    // Verify that the payment confirmation dialog is displayed
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verify that the payment confirmation text is displayed
    expect(find.text('Payment confirmed successfully!'), findsOneWidget);
  });
}
