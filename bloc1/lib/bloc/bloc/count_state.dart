part of 'count_bloc.dart';

@immutable
abstract class CountState {}

class CountInitial extends CountState {}

class CountPrintLoadedState extends CountState {}

class CountPrintState extends CountState {
  final int c;
  CountPrintState(this.c);
}
