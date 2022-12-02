part of 'count_bloc.dart';

@immutable
abstract class CountEvent {}

class CountLoadedEvent extends CountEvent {
  Function fnc;
  CountLoadedEvent(this.fnc);
}

class CountAllEvent extends CountEvent {}

class CountIncDecEvent extends CountEvent {
  final int c;
  CountIncDecEvent(this.c);
}

class CountSaveEvent extends CountEvent {
  final int c;
  final String s;
  CountSaveEvent(this.c, this.s);
}
