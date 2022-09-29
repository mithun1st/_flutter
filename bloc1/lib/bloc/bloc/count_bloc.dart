import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial()) {
    on<CountIncEvent>((event, emit) {
      emit(CountPrintState(event.c));
    });

    on<CountDecEvent>((event, emit) async {
      emit(CountPrintLoadedState());
      await Future.delayed(const Duration(seconds: 1));
      emit(CountPrintState(event.c));
    });
  }
}
