import 'package:assignment_monika/bloc/name_event.dart';
import 'package:assignment_monika/bloc/name_state.dart';
import 'package:assignment_monika/service/api_response.dart';
import 'package:assignment_monika/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  late final Repository _repository;

  NameBloc({
    Repository? repository,
  }) : super(InitialGetNameState()) {
    _repository = repository ?? Repository();
    on<GetNameEvent>((event, emit) => _getNameEventToState(event, emit));
  }

  Future<void> _getNameEventToState(
      GetNameEvent event, Emitter<NameState> emit) async {
    emit(LoadingNameState());
    try {
      var response = await _repository.getName(event.inputName);
      if (response.status == ApiResponseStatus.complete) {
        if (response.data != null && response.data!.isNotEmpty) {
          emit(SuccessGetNameState(nameList: response.data!));
        } else {
          emit(EmptyGetNameState());
        }
      } else {
        emit(ErrorGetNameState());
      }
    } catch (e) {
      emit(ErrorGetNameState());
    }
  }
}
