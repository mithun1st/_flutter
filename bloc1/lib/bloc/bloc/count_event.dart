part of 'count_bloc.dart';

@immutable
abstract class CountEvent {}

class CountIncEvent extends CountEvent {
  final int c;
  CountIncEvent(this.c);
}

class CountDecEvent extends CountEvent {
  final int c;
  CountDecEvent(this.c);
}
