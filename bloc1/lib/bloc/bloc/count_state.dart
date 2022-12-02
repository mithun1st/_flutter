part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class CountInitialState extends CountState {}

class CountLoadedState extends CountState {
  List<dynamic> probs;
  CountLoadedState(this.probs);
}

class CountExState extends CountState {}
