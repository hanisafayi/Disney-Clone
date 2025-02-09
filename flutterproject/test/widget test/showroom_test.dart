import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/showroom.dart';
import 'package:flutterproject/presentation/screen/available_cars.dart';
import 'package:flutterproject/presentation/screen/book_car.dart';

void main() {
  testWidgets('Showroom displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(Showroom());

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Car Rental App'), findsOneWidget);

    // Verify that the search bar is displayed
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the top cars section is displayed
    expect(find.text('TOP CARS'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the available cars section is displayed
    expect(find.text('Available Cars'), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);

    // Verify that the car brands section is displayed
    expect(find.text('CAR BRANDS'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the bottom navigation bar is displayed
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Showroom navigates to available cars page',
      (WidgetTester tester) async {
    await tester.pumpWidget(Showroom());

    // Tap on the available cars section
    await tester.tap(find.text('Available Cars'));

    // Verify that the available cars page is displayed
    expect(find.byType(AvailableCars), findsOneWidget);
  });

  testWidgets('Showroom navigates to book car page',
      (WidgetTester tester) async {
    await tester.pumpWidget(Showroom());

    // Tap on a car in the top cars section
    await tester.tap(find.byType(GestureDetector).first);

    // Verify that the book car page is displayed
    expect(find.byType(BookCar), findsOneWidget);
  });
}
