import 'package:flutter/material.dart';

import 'timer_models.dart';

class ReportTimeModel {
  final TimerModel reportTime;
  final String totalTimeConcentrated;
  final String timeReview;

  ReportTimeModel({
    @required this.reportTime,
    @required this.totalTimeConcentrated,
    @required this.timeReview,
  });
}
