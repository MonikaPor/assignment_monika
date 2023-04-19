import 'package:assignment_monika/bloc/name_bloc.dart';
import 'package:assignment_monika/bloc/name_event.dart';
import 'package:assignment_monika/bloc/name_state.dart';
import 'package:assignment_monika/service/api_response.dart';
import 'package:assignment_monika/model/name_model.dart';
import 'package:assignment_monika/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'name_bloc_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late NameBloc nameBloc;
  late MockRepository mockRepository;
  setUpAll(() {
    mockRepository = MockRepository();
    nameBloc = NameBloc(
      repository: mockRepository,
    );
  });

  group("GetNameDataEvent Handler", () {
    test('Success Case', () async {
      //given
      NameModel nameModel = NameModel(name: "Monika");
      List<NameModel> nameModelList = [nameModel];
      when(mockRepository.getName(any))
          .thenAnswer((_) async => ApiResponse.completed(nameModelList));

      //when
      nameBloc.add(GetNameEvent(inputName: ""));

      //then
      await expectLater(
          nameBloc.stream,
          emitsInOrder(([
            isA<LoadingNameState>(),
            isA<SuccessGetNameState>(),
          ])));
    });

    test('Empty Case', () async {
      //given
      when(mockRepository.getName(any))
          .thenAnswer((_) async => ApiResponse.completed([]));

      //when
      nameBloc.add(GetNameEvent(inputName: ""));

      //then
      await expectLater(
          nameBloc.stream,
          emitsInOrder(([
            isA<LoadingNameState>(),
            isA<EmptyGetNameState>(),
          ])));
    });

    test('Error Case', () async {
      //given
      when(mockRepository.getName(any)).thenThrow("Test Error");

      //when
      nameBloc.add(GetNameEvent(inputName: ""));

      //then
      await expectLater(
          nameBloc.stream,
          emitsInOrder(([
            isA<LoadingNameState>(),
            isA<ErrorGetNameState>(),
          ])));
    });
  });
}
