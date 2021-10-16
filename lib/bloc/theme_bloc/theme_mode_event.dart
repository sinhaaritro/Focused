import 'package:equatable/equatable.dart';

import '../../domain/theme_mode_model.dart';

abstract class ThemeModeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeModeChanged extends ThemeModeEvent {
  final AppThemeMode appThemeMode;

  ThemeModeChanged(this.appThemeMode) : assert(appThemeMode != null);

  @override
  List<Object> get props => [appThemeMode];
}
