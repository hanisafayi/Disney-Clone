import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';

void main() {
  testWidgets('Showroom displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Showroom(),
    ));

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the title is displayed
    expect(find.text('Car Rental App'), findsOneWidget);

    // Verify that the search bar is displayed
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the top cars title is displayed
    expect(find.text('TOP CARS'), findsOneWidget);

    // Verify that the top cars list is displayed
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the available cars button is displayed
    expect(find.text('Available Cars'), findsOneWidget);

    // Verify that the car brands title is displayed
    expect(find.text('CAR BRANDS'), findsOneWidget);

    // Verify that the car brands list is displayed
    expect(find.byType(ListView), findsOneWidget);
  });
}
