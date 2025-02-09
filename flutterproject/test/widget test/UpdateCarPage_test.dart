import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/data.dart';
import 'package:flutterproject/presentation/screen/UpdateCarPage.dart';
import 'package:flutterproject/presentation/screen/admin_page.dart';

void main() {
  testWidgets('UpdateCarPage UI Test', (WidgetTester tester) async {
    // Create a mock Car object
    final Car mockCar = Car(
      name: 'Test Car',
      color: 'Red',
      gearbox: 'Automatic',
      seat: 5,
      motor: 'V8',
      speed: 200,
      topSpeed: 250, photoAsset: '',
    );

    // Build the UpdateCarPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: UpdateCarPage(car: mockCar),
      ),
    );

    // Verify that the page displays the correct UI elements
    expect(find.text('Update Car'), findsOneWidget); // Verify app bar title
    expect(find.text('Car: Test Car'), findsOneWidget); // Verify car name
    expect(find.byType(TextField),
        findsNWidgets(7)); // Verify the presence of TextFields
    expect(find.byType(ElevatedButton),
        findsOneWidget); // Verify the presence of ElevatedButton
  });

  // Additional tests can be added for specific functionality if needed
}
