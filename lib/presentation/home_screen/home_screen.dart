import 'package:Focused/bloc/local_db_bloc/local_db_bloc.dart';
import 'package:Focused/bloc/timer_bloc/timer_bloc.dart';
import 'package:Focused/domain/report_date_model.dart';
import 'package:Focused/domain/report_time_model.dart';
import 'package:Focused/domain/timer_models.dart';
import 'package:Focused/infrastructure/moor_database.dart';
import 'package:Focused/infrastructure/timer/timer_repository.dart';
import 'package:Focused/presentation/reports_screen/reports_screen.dart';
import 'package:Focused/presentation/timer_screen/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawer_screen/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localDatabase = BlocProvider.of<LocalDatabaseBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Focused Timer"),
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.watch_later_outlined),
                child: Text("Timer"),
              ),
              Tab(
                icon: Icon(Icons.receipt_rounded),
                child: Text("Reports"),
              ),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            BlocProvider<TimerBloc>(
                create: (BuildContext context) => TimerBloc(TimerRepository(
                    TimerDao(localDatabase.state.localDatabase))),
                child: TimerScreen()),
            ReportsScreen(
              reportDateList: reportDateList,
            ),
          ],
        ),
      ),
    );
  }

  final List<ReportDateModel> reportDateList = [
    ReportDateModel(
      reportTimeList: [
        ReportTimeModel(
          reportTime: TimerModel(DateTime(2020, 10, 11, 09)),
          totalTimeConcentrated: "90",
          timeReview: "This is my 10AM feedback",
        ),
        ReportTimeModel(
          reportTime: TimerModel(DateTime(2020, 10, 11, 10)),
          totalTimeConcentrated: "70",
          timeReview: "This is my 11AM feedback",
        ),
      ],
      reportDate: TimerModel(DateTime(2020, 10, 11)),
      totalTimeConcentrated: "80",
    ),
    ReportDateModel(
      reportTimeList: [
        ReportTimeModel(
          reportTime: TimerModel(DateTime(2020, 10, 10, 09)),
          totalTimeConcentrated: "95",
          timeReview: "This is my 10AM feedback previous day",
        ),
        ReportTimeModel(
          reportTime: TimerModel(DateTime(2020, 10, 10, 10)),
          totalTimeConcentrated: "75",
          timeReview: "This is my 11AM feedback previous day",
        ),
      ],
      reportDate: TimerModel(DateTime(2020, 10, 10)),
      totalTimeConcentrated: "85",
    ),
  ];
}
