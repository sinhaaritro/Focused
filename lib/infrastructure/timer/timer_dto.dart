import 'package:Focused/domain/timer_models.dart';
import 'package:Focused/infrastructure/moor_database.dart';

class TimerDto {
  static TimerModel asDomain(TimerTable timerFromMoor) {
    return TimerModel(timerFromMoor.reportTime);
  }

  static TimerTable fromDomain(TimerModel timerToDomain) {
    return TimerTable(reportTime: timerToDomain.startTime);
  }
}
