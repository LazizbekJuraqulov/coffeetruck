part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class AfterPage extends RegisterEvent {
  int activeIndex;
  BuildContext context;
  AfterPage(this.activeIndex, this.context);
}

class Transfer extends RegisterEvent {}

class MyOrderTransferEvent extends RegisterEvent {}

class Transfer3Event extends RegisterEvent {}

class CloseTranferEvent extends RegisterEvent {
  bool isBool = true;
  CloseTranferEvent({required this.isBool});
}
