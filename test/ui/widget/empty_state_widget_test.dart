import 'package:assignment_monika/ui/widget/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createEmptyStateWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: EmptyStateWidget(),
      ),
    );
  }

  testWidgets('Empty state widget test', (WidgetTester tester) async {
    //when
    await tester.pumpWidget(createEmptyStateWidget());

    //then
    expect(find.text('Data Not Found\n Please try again'), findsOneWidget);
  });
}
