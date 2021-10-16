import 'package:Focused/infrastructure/moor_database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class LocalDatabaseState extends Equatable {
  final AppDatabase localDatabase = AppDatabase();

  @override
  List<Object> get props => [localDatabase];
}
