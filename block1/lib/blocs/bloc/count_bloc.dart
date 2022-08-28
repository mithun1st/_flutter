import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  int i = 0;

  CountBloc() : super(CountInitial()) {
    on<CountIncEvent>((event, emit) {
      i++;
      emit(CountIncState(i));
    });
  }
}
