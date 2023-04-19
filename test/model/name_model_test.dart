import 'package:assignment_monika/model/name_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Name Model fromJson Test', () async {
    //given
    var mockJson = {"name": "monika"};

    //when
    var expectResult = NameModel.fromJson(mockJson);

    //then
    expect(expectResult.name, "monika");
  });
}
