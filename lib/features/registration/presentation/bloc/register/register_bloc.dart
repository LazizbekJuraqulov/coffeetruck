import 'package:bloc/bloc.dart';
import 'package:coffeetruck1/features/home/presentation/widgets/homewidgets.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AfterPage>((event, emit) async {
      final state = this.state as Active;
      SharedPreferences presf = await SharedPreferences.getInstance();
      state.name = (presf.getString("name").toString());
      state.nomer = (presf.getString("phone").toString());

      state.isTrue = (presf.getBool("Active") ?? false);

      if (event.activeIndex == 2 || event.activeIndex == 3) {
        if (state.isTrue == false) {
          Navigator.push(event.context, MaterialPageRoute(builder: ((context) {
            return HomeWidget();
          })));
        }
      }

      emit(Active(event.activeIndex, state.isTrue, state.name, state.nomer));
    });
  }
}

class BlocProvider {}
