import 'package:bloc/bloc.dart';

import '../../domain/theme_mode_model.dart';
import 'theme_mode_event.dart';
import 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc()
      : super(
          const ThemeModeState(
            appThemeMode: AppThemeMode.system,
          ),
        );

  @override
  Stream<ThemeModeState> mapEventToState(
    ThemeModeEvent event,
  ) async* {
    if (event is ThemeModeChanged) {
      yield ThemeModeState(appThemeMode: event.appThemeMode);
    }
  }
}
