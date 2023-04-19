import 'package:assignment_monika/ui/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createSearchWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: SearchWidget(),
      ),
    );
  }

  testWidgets('Search list widget test', (WidgetTester tester) async {
    //when
    await tester.pumpWidget(createSearchWidget());

    //then
    expect(find.byKey(const Key("text_input")), findsOneWidget);
    Finder searchBtn = find.byKey(const Key("search_btn"));
    expect(searchBtn, findsOneWidget);
    expect(
      tester.widget(searchBtn),
      isA<InkWell>().having((w) => w.onTap, 'onTap', isNotNull),
    );
  });
}
