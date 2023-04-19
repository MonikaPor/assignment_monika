import 'package:assignment_monika/model/name_model.dart';
import 'package:assignment_monika/ui/widget/search_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<NameModel> nameListModel;

  Widget createSearchListWidget() {
    return MaterialApp(
      home: Scaffold(
        body: SearchListWidget(nameList: nameListModel),
      ),
    );
  }

  setUpAll(() {
    NameModel nameModel = NameModel(name: 'Monika');
    nameListModel = [nameModel];
  });

  testWidgets('Search list widget test', (WidgetTester tester) async {
    //when
    await tester.pumpWidget(createSearchListWidget());

    //then
    expect(find.byKey(const Key("item_index_0")), findsOneWidget);
  });
}
