import 'package:flutter/material.dart';

import 'report_time_model.dart';
import 'timer_models.dart';

class ReportDateModel {
  final TimerModel reportDate;
  final String totalTimeConcentrated;
  final List<ReportTimeModel> reportTimeList;

  ReportDateModel({
    @required this.reportDate,
    @required this.reportTimeList,
    @required this.totalTimeConcentrated,
  });
}
