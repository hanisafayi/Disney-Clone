import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/payment.dart';

void main() {
  testWidgets('Payment page displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'Car Rental App',
      home: PaymentPage(),
    ));

    expect(find.text('Payment page'), findsOneWidget);

    expect(find.text('Enter Payment Information'), findsOneWidget);
    expect(find.text('acccount number'), findsOneWidget);
    expect(find.text('reciever account number'), findsOneWidget);
    expect(find.text('Amount (ETB)'), findsOneWidget);
    expect(find.text('payment password'), findsOneWidget);

    expect(find.text('Confirm Payment'), findsOneWidget);
  });

  testWidgets('Payment page handles form input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'Car Rental App',
      home: PaymentPage(),
    ));

    await tester.enterText(
        find.bySemanticsLabel('acccount number'), '12345678');
    await tester.enterText(
        find.bySemanticsLabel('reciever account number'), '87654321');
    await tester.enterText(find.bySemanticsLabel('Amount (ETB)'), '1000');
    await tester.enterText(
        find.bySemanticsLabel('payment password'), 'password123');

    
    await tester.tap(find.text('Confirm Payment'));

    expect(find.text('Payment Confirmation'), findsOneWidget);
    expect(find.text('Payment confirmed successfully!'), findsOneWidget);
  });
}
