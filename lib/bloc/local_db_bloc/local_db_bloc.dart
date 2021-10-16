import 'package:Focused/bloc/local_db_bloc/local_db_event.dart';
import 'package:Focused/bloc/local_db_bloc/local_db_state.dart';
import 'package:bloc/bloc.dart';

class LocalDatabaseBloc extends Bloc<LocalDatabaseEvent, LocalDatabaseState> {
  LocalDatabaseBloc() : super(LocalDatabaseState());

  @override
  Stream<LocalDatabaseState> mapEventToState(LocalDatabaseEvent event) async* {
    if (event is LocalDatabaseInitialize) {
      yield LocalDatabaseState();
    }
  }
}
