import 'package:Focused/domain/timer_models.dart';
import 'package:Focused/infrastructure/timer/timer_dto.dart';

import '../moor_database.dart';

class TimerRepository {
  final TimerDao timerDao;

  TimerRepository(this.timerDao);

  Future<List<TimerModel>> getTimers() async {
    final List<TimerTable> timersListFromMoor = await timerDao.getAllTimers();
    final List<TimerModel> timersListToModel = [];
    for (final timer in timersListFromMoor) {
      timersListToModel.add(TimerDto.asDomain(timer));
    }
    return timersListToModel;
  }

  void addTimers(TimerModel timer) {
    final TimerTable addTimer = TimerTable(reportTime: timer.startTime);
    timerDao.insertTimers(addTimer);
  }

  void deleteTimers(TimerModel timer) {
    final TimerTable deleteTimer = TimerTable(reportTime: timer.startTime);
    timerDao.deleteTimers(deleteTimer);
  }

  void updateTimers(TimerModel timer) {
    final TimerTable updateTimer = TimerTable(reportTime: timer.startTime);
    timerDao.updateTimers(updateTimer);
  }
}
