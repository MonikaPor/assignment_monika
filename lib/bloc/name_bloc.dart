import 'package:assignment_monika/bloc/name_event.dart';
import 'package:assignment_monika/bloc/name_state.dart';
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
      if (response.isNotEmpty) {
        emit(SuccessGetNameState(nameList: response));
      } else {
        emit(EmptyGetNameState());
      }
    } catch (e) {
      emit(ErrorGetNameState());
    }
  }
}
