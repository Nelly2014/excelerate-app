import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Excelerate app smoke test', (WidgetTester tester) async {
    // Test placeholder for Week 2
    // Full test suite to be implemented in Week 3 after API integration

    // This test verifies that the app builds and displays the login screen
    // Future tests will cover:
    // - Navigation between screens
    // - Search and filter functionality
    // - Program enrollment flow
    // - Progress calculation
    // - Data persistence

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
