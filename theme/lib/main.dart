import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/bloc/theme_bloc.dart';
import 'package:theme/home_page.dart';
import 'package:theme/themes/dark.dart';
import 'package:theme/themes/light.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool _isDark = false;
        state is ThemeChangeState ? _isDark = state.isDark : _isDark = false;
        return MaterialApp(
          theme: _isDark ? dark : light,
          title: 'Theme Ex',
          home: MyAppScreen(),
        );
      },
    );
  }
}
