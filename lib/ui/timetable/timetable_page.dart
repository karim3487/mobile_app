import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/models/timetable.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/shared/colors.dart';
import 'package:weekview_calendar/weekview_calendar.dart';
import '../../stores/timetable/timetable_store.dart';
import '../../utils/routes.dart';
import '../../widgets/navbar.dart';
import '../../widgets/progress_indicator_widget.dart';
import 'group_dialog.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  late TimetableStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<TimetableStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getTimetableList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      drawer: NavBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          },
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'changeGroup',
                  child: Text('Выбрать группу'),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'changeGroup') {
                _store.getGroups();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GroupChoiceDialog();
                    });
              }
            },
          ),
        ],
        title: Text("Рассписание"),
      ),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Observer _buildMainContent() {
    return Observer(
      builder: (context) {
        return _store.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  _buildListView() {
    Timetable? timetable = _store.timetable;
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildCalendar(),
          ),
          timetable != null
              ? Positioned(
                  top: 125,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _store.timetable!.isEven!
                                    ? "Четная неделя"
                                    : "Нечетная неделя",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  _store.groupCode,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10)
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: timetable.allSubjects!.length,
                        separatorBuilder: (context, position) {
                          return SizedBox(height: 5);
                        },
                        itemBuilder: (context, position) {
                          return _buildListItem(position);
                        },
                      ),
                    ],
                  ),
                )
              : Positioned(
                  top: 125,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 1000,
                    width: 1000,
                    color: AppColors.primary,
                    child: const Center(
                        child: Text(
                      "Рассписания на этот день нет",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                )
        ],
      ),
    );
  }

  _buildListItem(int position) {
    return _buildCard(position);
  }

  _buildCard(int position) {
    List<Lesson> lessons = _store.timetable!.allSubjects!;
    String professorsNames = _store
        .timetable!.allSubjects![position].professors!
        .map((professor) => professor.name)
        .join(", ");

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.book,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      lessons[position].title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(
                Icons.person,
                // size: 20,
              ),
              const SizedBox(width: 2),
              Text(
                professorsNames != ''
                    ? '${professorsNames}'
                    : 'Преподаватели не указаны',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ]),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      const Icon(
                        Icons.location_on,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        lessons[position].classroom != null
                            ? lessons[position].classroom!.substring(
                                0, lessons[position].classroom!.length - 2)
                            : 'Не указана',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${lessons[position].start!.format(context)} - ${lessons[position].end!.format(context)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildCalendar() {
    return Observer(
      builder: (BuildContext context) {
        return WeekviewCalendar(
          firstDay: DateTime.now().subtract(const Duration(days: 365)),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          focusedDay: _store.focusedDay,
          calendarFormat: CalendarFormat.week,
          locale: 'ru_RU',
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_store.focusedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_store.focusedDay, selectedDay)) {
              _store.focusedDay = focusedDay;
            }
          },
          onPageChanged: (focusedDay) {
            _store.focusedDay = focusedDay;
            print('FDAY: ${_store.focusedDay}');
            _store.getTimetableList();
          },
        );
      },
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_store.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_store.errorStore.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: "Ошибка",
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }
}
