import 'package:assignment_monika/model/name_model.dart';

abstract class NameState {}

class InitialGetNameState extends NameState {}

class LoadingNameState extends NameState {}

class SuccessGetNameState extends NameState {
  final List<NameModel> nameList;

  SuccessGetNameState({required this.nameList});

  List<Object> get props => [nameList];
}

class EmptyGetNameState extends NameState {}

class ErrorGetNameState extends NameState {}
