import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/pages/pair_price_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PairPricePage Widget Tests', () {
    testWidgets('Initial state of PairPricePage', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Verify initial state
      expect(find.text('Pair Price \$'), findsOneWidget);
      expect(find.text('Which one is cheaper? You can easily check!'),
          findsOneWidget);

      // Check initial price and volume fields
      expect(find.byType(TextField),
          findsNWidgets(4)); // 2 sets of price/volume fields
      expect(find.text('Price'), findsNWidgets(2));
      expect(find.text('Volume'), findsNWidgets(2));
    });

    testWidgets('Add Price Field functionality', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Find the Add Price Field button
      final addFieldButton = find.text('Add Price Field');

      // Tap the button twice to add two more fields
      await tester.tap(addFieldButton);
      await tester.pump();
      await tester.tap(addFieldButton);
      await tester.pump();

      // Verify 4 sets of price/volume fields now exist
      expect(find.byType(TextField), findsNWidgets(8));
    });

    /* testWidgets('Remove Price Field via Dismissible',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Ensure we start with 2 fields
      expect(find.byType(TextField), findsNWidgets(4));

      // Swipe to dismiss the first field
      final firstDismissible = find.byType(Dismissible).first;
      await tester.drag(firstDismissible, const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify only 1 set of fields remains
      expect(find.byType(TextField), findsNWidgets(2));
    }); */

    testWidgets('Remove Price Field via Dismissible',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Add a third field first to ensure we can test dismissal
      final addFieldButton = find.text('Add Price Field');
      await tester.tap(addFieldButton);
      await tester.pump();

      // Ensure we now have 3 sets of fields
      expect(find.byType(TextField), findsNWidgets(6));

      // Get all Dismissible widgets
      final dismissibles = find.byType(Dismissible);

      // Swipe to dismiss the third field (index 2)
      await tester.drag(dismissibles.at(2), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify that we still have 2 sets of fields (the first two cannot be removed)
      expect(find.byType(TextField), findsNWidgets(4));
    });

    testWidgets('Check Prices with Valid Data', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Find text fields
      final priceFinders = find.byType(TextField).at(0);
      final volumeFinder = find.byType(TextField).at(1);
      final secondPriceFinder = find.byType(TextField).at(2);
      final secondVolumeFinder = find.byType(TextField).at(3);

      // Enter test data
      await tester.enterText(priceFinders, '10');
      await tester.enterText(volumeFinder, '2');
      await tester.enterText(secondPriceFinder, '15');
      await tester.enterText(secondVolumeFinder, '3');

      // Find and tap the Check! button
      final checkButton = find.text('Check!');
      await tester.tap(checkButton);
      await tester.pumpAndSettle();

      // Verify bottom sheet appears with cheapest product
      expect(find.text('Product 1 is the cheapest!'), findsOneWidget);
      expect(find.byType(BarChart), findsOneWidget);
    });

    testWidgets('Check Prices with Invalid Data', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PairPricePage()));

      // Find the Check! button
      final checkButton = find.text('Check!');
      await tester.tap(checkButton);
      await tester.pumpAndSettle();

      // Verify error dialog appears
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Please enter valid prices and volumes.'), findsOneWidget);
    });

    test('PriceData class works correctly', () {
      final priceData = PriceData('Test Product', 5.0);

      expect(priceData.product, 'Test Product');
      expect(priceData.unitPrice, 5.0);
    });
  });
}
