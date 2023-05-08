part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class Active extends RegisterState {
  
  int activeIndex;
  bool isTrue;
  String name;
  String nomer;
  Active( this.activeIndex, this.isTrue,this.name,this.nomer);
}

