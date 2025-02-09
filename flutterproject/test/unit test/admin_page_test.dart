import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/AddCarPage.dart';
import 'package:flutterproject/presentation/screen/UpdateCarPage.dart';
import 'package:flutterproject/presentation/screen/admin_page.dart';

void main() {
  test('AdminPage displays correctly', () {
    // Create a test widget
    Widget testWidget = MaterialApp(
      home: AdminPage(),
    );

    // Render the widget
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetTester tester = TestWidgetsFlutterBinding.instance as WidgetTester;
    tester.pumpWidget(testWidget);

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Admin Page'), findsOneWidget);

    // Verify that the list view is displayed
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the cards are displayed
    expect(find.byType(Card), findsNWidgets(3));

    // Verify that the floating action button is displayed
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('Add Car'), findsOneWidget);
  });

  test('AdminPage navigates to AddCarPage', () {
    // Create a test widget
    Widget testWidget = MaterialApp(
      home: AdminPage(),
    );

    // Render the widget
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetTester tester = TestWidgetsFlutterBinding.instance as WidgetTester;
    tester.pumpWidget(testWidget);

    // Tap on the floating action button
    tester.tap(find.byType(FloatingActionButton));

    // Verify that the AddCarPage is displayed
    expect(find.byType(AddCarPage), findsOneWidget);
  });

  test('AdminPage navigates to UpdateCarPage', () {
    // Create a test widget
    Widget testWidget = MaterialApp(
      home: AdminPage(),
    );

    // Render the widget
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetTester tester = TestWidgetsFlutterBinding.instance as WidgetTester;
    tester.pumpWidget(testWidget);

    // Tap on the edit button
    tester.tap(find.byIcon(Icons.edit));

    // Verify that the UpdateCarPage is displayed
    expect(find.byType(UpdateCarPage), findsOneWidget);
  });

  test('AdminPage removes car from list', () {
    // Create a test widget
    Widget testWidget = MaterialApp(
      home: AdminPage(),
    );

    // Render the widget
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetTester tester = TestWidgetsFlutterBinding.instance as WidgetTester;
    tester.pumpWidget(testWidget);

    // Tap on the delete button
    tester.tap(find.byIcon(Icons.delete));

    // Verify that the car is removed from the list
    expect(find.byType(Card), findsNWidgets(2));
  });
}
