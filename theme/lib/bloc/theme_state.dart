part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChangeState extends ThemeState {
  final bool isDark;
  ThemeChangeState(this.isDark);
}
