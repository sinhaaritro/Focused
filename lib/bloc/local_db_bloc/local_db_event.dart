import 'package:equatable/equatable.dart';

abstract class LocalDatabaseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LocalDatabaseInitialize extends LocalDatabaseEvent {
  @override
  List<Object> get props => [];
}
