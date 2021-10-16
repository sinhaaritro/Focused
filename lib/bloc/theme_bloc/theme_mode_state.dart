import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/theme_mode_model.dart';

@immutable
class ThemeModeState extends Equatable {
  final AppThemeMode appThemeMode;

  const ThemeModeState({@required this.appThemeMode});

  @override
  List<Object> get props => [appThemeMode];
}
