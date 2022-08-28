part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class CountInitial extends CountState {}

class CountIncState extends CountState {
  int count;
  CountIncState(this.count);
}

class CountDecState extends CountState {}
