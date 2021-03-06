import 'package:Focused/domain/timer_models.dart';
import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerStateLoading extends TimerState {}

class TimerStateLoaded extends TimerState {
  final List<TimerModel> upComingTimerList;

  TimerStateLoaded(this.upComingTimerList);
}

class TimerStateEmpty extends TimerState {}

class TimerStateError extends TimerState {}
