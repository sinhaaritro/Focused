import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme_bloc/theme_mode_bloc.dart';
import '../../bloc/theme_bloc/theme_mode_event.dart';
import '../../bloc/theme_bloc/theme_mode_state.dart';
import '../../domain/theme_mode_model.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AppThemeMode _appThemeMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            BlocBuilder<ThemeModeBloc, ThemeModeState>(
              builder: (context, state) {
                _appThemeMode = state.appThemeMode;
                return ListTile(
                  title: const Text("App Theme"),
                  onTap: () => _onThemeModeButtonPressed(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onThemeModeButtonPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            const ListTile(
              title: Text("Choose Theme"),
            ),
            const Divider(),
            RadioListTile(
              title: const Text("Use light theme"),
              value: AppThemeMode.light,
              groupValue: _appThemeMode,
              onChanged: (AppThemeMode value) => _selectedTheme(value),
            ),
            RadioListTile(
              title: const Text("Use dark theme"),
              value: AppThemeMode.dark,
              groupValue: _appThemeMode,
              onChanged: (AppThemeMode value) => _selectedTheme(value),
            ),
            RadioListTile(
              title: const Text("Use system default theme"),
              value: AppThemeMode.system,
              groupValue: _appThemeMode,
              onChanged: (AppThemeMode value) => _selectedTheme(value),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _selectedTheme(AppThemeMode selectedTheme) {
    Navigator.pop(context);
    final themeModeBloc = context.bloc<ThemeModeBloc>();
    themeModeBloc.add(ThemeModeChanged(selectedTheme));
    setState(() {
      _appThemeMode = selectedTheme;
    });
  }
}
