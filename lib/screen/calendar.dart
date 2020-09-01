import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:withyou/component/NeumorphicBackground.dart';
import 'package:withyou/component/dialog/WYSimpleDialog.dart';
import 'package:withyou/shared/Colors.dart';

Map<DateTime, List> _holidays = Map();

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  Map<DateTime, List> _events;
  DateTime _selectedDate;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Color(0xFFEAEBF3),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(children: [
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFEAEBF3),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(-3.0, -3.0),
                              blurRadius: 5.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildCalendar(),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16))),
                          height: 48,
                          color: colorNeuGrey,
                          onPressed: () {
                            _setEvents();
                          },
                          splashColor: Colors.white70,
                          child: Icon(
                            Icons.add,
                            color: colorNeuWhite,
                          ),
                        ),
                      ],
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.access_alarm),
                      title: Text("Hello World"),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 5, color: colorNeuPink),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_alarm),
                      title: Text("Hello World"),
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _events,
      availableCalendarFormats: {CalendarFormat.month: "Month"},
      startDay: DateTime(1970),
      endDay: DateTime(2060),
      onDaySelected: (day, events) {
        _selectedDate = day;
      },
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekStyle:
          DaysOfWeekStyle(weekendStyle: TextStyle(color: colorNeuPink)),
      headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          titleTextStyle: TextStyle(fontSize: 28, color: colorNeuGrey)),
      calendarStyle: CalendarStyle(
        weekendStyle: TextStyle(color: colorNeuGrey),
      ),
    );
  }

  Widget _setEvents() {
    if (_selectedDate == null) {
      WYSimpleDialog.show(context, DialogType.warning, "Warning",
          "Nothing Selected", false, "Close", "");
      return null;
    }
  }

  Widget _getEvents() {}

  void _loadEvents() {}
}
