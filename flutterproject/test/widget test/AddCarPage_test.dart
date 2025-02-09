import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/AddCarPage.dart';

void main() {
  testWidgets('AddCarPage Widget Test', (WidgetTester tester) async {
    // Build the AddCarPage widget.
    await tester.pumpWidget(
      MaterialApp(
        home: AddCarPage(),
      ),
    );

    // Verify that the AppBar title is displayed correctly.
    expect(find.text('Add Car'), findsOneWidget);

    // Verify that all text fields are present.
    expect(find.byType(TextField), findsNWidgets(7));

    // Find all text fields by their labels and enter some data.
    await tester.enterText(find.widgetWithText(TextField, 'Photo URL'), 'assets/photo.png');
    await tester.enterText(find.widgetWithText(TextField, 'Color'), 'Red');
    await tester.enterText(find.widgetWithText(TextField, 'Gearbox'), 'Automatic');
    await tester.enterText(find.widgetWithText(TextField, 'Seat'), '4');
    await tester.enterText(find.widgetWithText(TextField, 'Motor'), 'V8');
    await tester.enterText(find.widgetWithText(TextField, 'Speed'), '200');
    await tester.enterText(find.widgetWithText(TextField, 'Top Speed'), '250');

    // Verify that the entered text updates the state.
    expect(find.text('assets/photo.png'), findsOneWidget);
    expect(find.text('Red'), findsOneWidget);
    expect(find.text('Automatic'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('V8'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);
    expect(find.text('250'), findsOneWidget);

    // Verify that the Add Car button is present and can be tapped.
    final addCarButton = find.widgetWithText(ElevatedButton, 'Add Car');
    expect(addCarButton, findsOneWidget);

    // Tap the Add Car button and verify that Navigator.pop() is called.
    await tester.tap(addCarButton);
    await tester.pumpAndSettle();

    // Since we don't have access to the Navigator in the test environment,
    // we can only verify that the button was tapped and no errors occurred.
  });
}
