abstract class NameEvent {}

class GetNameEvent extends NameEvent {
  final String inputName;

  GetNameEvent({required this.inputName});
}
