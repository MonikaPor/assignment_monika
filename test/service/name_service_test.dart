import 'package:assignment_monika/service/api_response.dart';
import 'package:assignment_monika/service/name_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'name_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late NameService nameService;
  setUpAll(() {
    mockDio = MockDio();
    nameService = NameService(mockDio: mockDio);
  });
  group('Name service test', () {
    test("Success case", () {
      //given
      Response response =
          Response(requestOptions: RequestOptions(), statusCode: 200, data: []);
      when(mockDio.get(any)).thenAnswer((_) async => response);

      //when
      var expectedResult = nameService.getName(inputName: "inputName");

      //then
      expectedResult.then((value) {
        expect(value.status, ApiResponseStatus.complete);
      });
    });

    test("Error case", () {
      //given
      Response response =
          Response(requestOptions: RequestOptions(), statusCode: 400);
      when(mockDio.get(any)).thenAnswer((_) async => response);

      //when
      var expectedResult = nameService.getName(inputName: "inputName");

      //then
      expectedResult.then((value) {
        expect(value.status, ApiResponseStatus.error);
      });
    });
  });
}
