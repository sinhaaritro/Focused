import 'package:Focused/domain/timer_models.dart';
import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTimerEvent extends TimerEvent {}

class AddTimerEvent extends TimerEvent {
  final TimerModel addTimer;

  AddTimerEvent(this.addTimer);
}

class UpdateTimerEvent extends TimerEvent {
  final TimerModel updateTimer;

  UpdateTimerEvent(this.updateTimer);
}

class DeleteTimerEvent extends TimerEvent {
  final TimerModel deleteTimer;

  DeleteTimerEvent(this.deleteTimer);
}
