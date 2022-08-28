part of 'count_bloc.dart';

@immutable
abstract class CountEvent {}

class CountIncEvent extends CountEvent {}

class CountDecEvent extends CountEvent {}
