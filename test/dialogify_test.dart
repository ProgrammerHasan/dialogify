import 'package:flutter_test/flutter_test.dart';
import 'package:dialogify/dialogify.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Confirmation dialog renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                showConfirmationDialog(context);
              },
              child: const Text("Open"),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Open"));
    await tester.pumpAndSettle();

    expect(find.text("Are you sure?"), findsOneWidget);
  });
}
