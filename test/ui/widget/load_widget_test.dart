import 'package:assignment_monika/ui/widget/load_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createLoadWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: LoadWidget(),
      ),
    );
  }

  testWidgets('Load state widget test', (WidgetTester tester) async {
    //when
    await tester.pumpWidget(createLoadWidget());

    //then
    expect(find.byKey(const Key("loading_indicator")), findsOneWidget);
  });
}
