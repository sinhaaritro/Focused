class TimerModel {
  final DateTime startTime;
  DateTime endTime;

  TimerModel(this.startTime) {
    getEndTimer();
  }

  void getEndTimer() {
    endTime = startTime.add(const Duration(hours: 1));
  }
}
