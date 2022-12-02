import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitialState()) {
    on<CountEvent>((event, emit) {
      emit(CountInitialState());
    });

    // as like server (Post/Get)
    int serverInt = 12;
    String serverString = 'Hello World';

    List<dynamic> probFromApi = [0, ''];

    on<CountLoadedEvent>((event, emit) async {
      emit(CountInitialState());
      //just like api call
      event.fnc('loading...');
      await Future.delayed(const Duration(seconds: 2));
      probFromApi[0] = serverInt;
      probFromApi[1] = serverString;
      event.fnc(probFromApi[1]);
      // emit(CountExState()); //to get error
      emit(CountLoadedState(probFromApi));
    });
    //------------
    on<CountAllEvent>((event, emit) async {
      emit(CountLoadedState(probFromApi));
    });
    //-----------
    on<CountIncDecEvent>((event, emit) async {
      probFromApi[0] = event.c;
      emit(CountLoadedState(probFromApi));
    });
    //-----------
    on<CountSaveEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 5));
      serverInt = event.c;
      serverString = event.s;
      emit(CountLoadedState(probFromApi));
    });
  }
}
