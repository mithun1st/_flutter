part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeChangeEvent extends ThemeEvent {
  bool isDark;
  ThemeChangeEvent(this.isDark);
}
