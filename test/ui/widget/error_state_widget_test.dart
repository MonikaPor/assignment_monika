import 'package:assignment_monika/ui/widget/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createErrorStateWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: ErrorStateWidget(),
      ),
    );
  }

  testWidgets('Error state widget test', (WidgetTester tester) async {
    //when
    await tester.pumpWidget(createErrorStateWidget());

    //then
    expect(
        find.text(
            "We are sorry!\nWe cannot retrieve the data\nPlease try again later"),
        findsOneWidget);
  });
}
