import 'package:Focused/bloc/timer_bloc/timer_event.dart';
import 'package:Focused/bloc/timer_bloc/timer_state.dart';
import 'package:Focused/domain/timer_models.dart';
import 'package:Focused/infrastructure/timer/timer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final TimerRepository timerRepository;

  TimerBloc(this.timerRepository) : super(TimerStateLoading());

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is GetTimerEvent) {
      yield* _mapGetTimersToState(event);
    } else if (event is AddTimerEvent) {
      yield* _mapAddTimersToState(event);
    } else if (event is UpdateTimerEvent) {
      yield* _mapUpdateTimersToState(event);
    } else if (event is DeleteTimerEvent) {
      yield* _mapDeleteTimersToState(event);
    }
  }

  Stream<TimerState> _mapGetTimersToState(GetTimerEvent event) async* {
    try {
      yield TimerStateLoading();

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
    }
  }

  Stream<TimerState> _mapAddTimersToState(AddTimerEvent event) async* {
    try {
      final TimerModel addTimer = TimerModel(event.addTimer.startTime);
      timerRepository.addTimers(addTimer);

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
    }
  }

  Stream<TimerState> _mapUpdateTimersToState(UpdateTimerEvent event) async* {
    try {
      final TimerModel updateTimer = TimerModel(event.updateTimer.startTime);
      timerRepository.updateTimers(updateTimer);

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
    }
  }

  Stream<TimerState> _mapDeleteTimersToState(DeleteTimerEvent event) async* {
    try {
      final TimerModel deleteTimer = TimerModel(event.deleteTimer.startTime);
      timerRepository.deleteTimers(deleteTimer);

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
    }
  }
}
