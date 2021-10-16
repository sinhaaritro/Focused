import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/local_db_bloc/local_db_bloc.dart';
import 'bloc/theme_bloc/theme_mode_bloc.dart';
import 'bloc/theme_bloc/theme_mode_state.dart';
import 'domain/theme_mode_model.dart';
import 'presentation/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ThemeModeBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => LocalDatabaseBloc(),
        ),
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (context, state) {
        print(ThemeMode.system);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: appThemeModeData[state.appThemeMode],
          theme: ThemeData(
            primarySwatch: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
