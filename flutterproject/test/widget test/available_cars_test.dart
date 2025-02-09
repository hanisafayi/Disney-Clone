import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/models/car.dart';
import 'package:flutterproject/presentation/screen/available_Cars.dart';
import 'package:flutterproject/presentation/screen/book_Car.dart';
import 'package:flutterproject/data.dart';

void main() {
  testWidgets('AvailableCars', (WidgetTester tester) async {
    // Build the AvailableCars widget
    await tester.pumpWidget(MaterialApp(
      home: AvailableCars(),
    ));

    // Verify that the title is rendered
    expect(find.text("Available Cars"), findsOneWidget);

    // Verify that the filter icon is rendered
    expect(find.byIcon(Icons.filter_list), findsOneWidget);

    // Verify that the grid view is rendered with the correct number of cars
    expect(find.byType(GridTile), findsNWidgets(getCarList().length));

    // Tap on the first car in the grid view
    await tester.tap(find.byType(GridTile).first);
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that navigation to the BookCar screen occurred
    expect(find.byType(BookCar), findsOneWidget);

    // Tap on a filter
    await tester.tap(find.text(getFilterList().first.name));
    await tester.pumpAndSettle(); // Wait for UI to update

    // Verify that the selected filter is updated
    expect(find.text(getFilterList().first.name), findsOneWidget);
    expect(find.text(getFilterList().last.name),
        findsNothing); // Ensure the other filter is not selected
  });
}
