import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/constants.dart';
import 'package:flutterproject/models/car.dart';
import 'package:flutterproject/presentation/screen/available_Cars.dart';
import 'package:flutterproject/presentation/screen/book_Car.dart';
import 'package:flutterproject/data.dart';

void main() {
  testWidgets('AvailableCars displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AvailableCars(),
    ));

    // Verify that the app bar is not displayed
    expect(find.byType(AppBar), findsNothing);

    // Verify that the back button is displayed
    expect(find.byIcon(Icons.keyboard_arrow_left), findsOneWidget);

    // Verify that the title is displayed
    expect(
        find.text("Available Cars (${getCarList().length})"), findsOneWidget);

    // Verify that the grid view is displayed
    expect(find.byType(GridView), findsOneWidget);

    // Verify that the cars are displayed
    expect(find.byType(Car), findsNWidgets(getCarList().length));

    // Verify that the bottom navigation bar is displayed
    expect(find.byType(Container), findsOneWidget);

    // Verify that the filter icon is displayed
    expect(find.byIcon(Icons.filter_list), findsOneWidget);

    // Verify that the filters are displayed
    expect(find.byType(Text), findsNWidgets(getFilterList().length));
  });

  testWidgets('AvailableCars navigates to BookCar screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AvailableCars(),
    ));

    // Tap on a car
    await tester.tap(find.byType(Car).first);

    // Verify that the BookCar screen is displayed
    expect(find.byType(BookCar), findsOneWidget);
  });

  testWidgets('AvailableCars updates selected filter',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AvailableCars(),
    ));

    // Tap on a filter
    await tester.tap(find.byType(Text).first);

    // Verify that the selected filter is updated
    expect(
        find.byType(Text).first,
        style(
          TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  });
}
