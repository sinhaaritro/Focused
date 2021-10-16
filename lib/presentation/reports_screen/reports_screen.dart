import 'package:Focused/domain/report_date_model.dart';
import 'package:Focused/domain/report_time_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends StatelessWidget {
  final List<ReportDateModel> reportDateList;

  const ReportsScreen({Key key, this.reportDateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reportDateList.length,
        itemBuilder: (context, index) {
          return ReportDateWidget(
            reportDateModel: reportDateList[index],
          );
        },
      ),
    );
  }
}

class ReportDateWidget extends StatelessWidget {
  final ReportDateModel reportDateModel;

  const ReportDateWidget({Key key, this.reportDateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date =
        DateFormat.MMMd('en_US').format(reportDateModel.reportDate.startTime);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date, style: Theme.of(context).textTheme.headline6),
                Text(reportDateModel.totalTimeConcentrated,
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: reportDateModel.reportTimeList
                  .map(
                    (reportTime) => ReportTimeWidget(
                      reportTime: reportTime,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportTimeWidget extends StatelessWidget {
  final ReportTimeModel reportTime;

  const ReportTimeWidget({Key key, this.reportTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String startTime =
        DateFormat.jm().format(reportTime.reportTime.startTime);
    final String endTime =
        DateFormat.jm().format(reportTime.reportTime.endTime);

    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$startTime - $endTime"),
          Text("${reportTime.totalTimeConcentrated}%"),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(reportTime.timeReview),
        ),
      ],
    );
  }
}
