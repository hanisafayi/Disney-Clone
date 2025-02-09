import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/AddCarPage.dart';
import 'package:flutterproject/presentation/screen/UpdateCarPage.dart';
import 'package:flutterproject/presentation/screen/admin_page.dart';

void main() {
  testWidgets('AdminPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AdminPage(),
    ));

    // Verify that the app bar is displayed
    expect(find.text('Admin Page'), findsOneWidget);

    // Verify that the list of cars is displayed
    expect(find.byType(ListTile), findsNWidgets(3));

    // Verify that the car details are displayed correctly
    expect(find.text('Marcedes'), findsOneWidget);
    expect(find.text('BMW'), findsOneWidget);
    expect(find.text('KIA'), findsOneWidget);

    // Verify that the 'Edit' and 'Delete' buttons are displayed
    expect(find.byIcon(Icons.edit), findsNWidgets(3));
    expect(find.byIcon(Icons.delete), findsNWidgets(3));
  });

  testWidgets('Clicking the "Add Car" button navigates to AddCarPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AdminPage(),
    ));

    // Tap the "Add Car" button
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify that the AddCarPage is displayed
    expect(find.byType(AddCarPage), findsOneWidget);
  });

  testWidgets('Clicking the "Edit" button navigates to UpdateCarPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AdminPage(),
    ));

    // Tap the "Edit" button for the first car
    await tester.tap(find.byIcon(Icons.edit).first);
    await tester.pumpAndSettle();

    // Verify that the UpdateCarPage is displayed
    expect(find.byType(UpdateCarPage), findsOneWidget);
  });

  testWidgets('Clicking the "Delete" button removes the car',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AdminPage(),
    ));

    // Get the initial number of cars
    int initialCarCount = find.byType(ListTile).evaluate().length;

    // Tap the "Delete" button for the first car
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();

    // Verify that the number of cars has decreased by 1
    expect(find.byType(ListTile), findsNWidgets(initialCarCount - 1));
  });
}
