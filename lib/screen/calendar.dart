import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:withyou/component/dialog/WYSimpleDialog.dart';
import 'package:withyou/shared/Colors.dart';

/* Map<DateTime, List> _holidays = Map(); */

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  Map<DateTime, List> _events;
  DateTime _selectedDate;
  CalendarController _calendarController;
  List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _calendarController = CalendarController();

    if (_widgets == null) {
      _widgets = List<Widget>();
    } else if (_widgets.length > 0) {
      _widgets.clear();
    }
    _buildWigets();
    _widgets.add(Container(
      height: 16,
    ));
    _loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(
              backgroundColor: Color(0xFFEAEBF3),
              body: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _widgets),
                  ),
                ],
              ))),
    );
  }

  List<Widget> _buildWigets() {
    _widgets.add(Wrap(children: [
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
            ],
          )),
    ]));
    return _widgets;
  }

  Widget _buildCalendar() {
    return Wrap(children: [
      Container(
          decoration: BoxDecoration(
              color: Color(0xFFEAEBF3),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(4.0, 4.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TableCalendar(
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
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: colorNeuPink)),
                headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    titleTextStyle:
                        TextStyle(fontSize: 28, color: colorNeuGrey)),
                calendarStyle: CalendarStyle(
                  weekendStyle: TextStyle(color: colorNeuGrey),
                ),
              ),
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
    ]);
  }

  void _setEvents() {
    if (_selectedDate == null) {
      WYSimpleDialog.show(context, DialogType.warning, "Warning",
          "Nothing Selected", false, "Close", "");
    } else {
      Future<String> result = WYSimpleDialog.show<String>(context,
          DialogType.textInput, "New Events", "Events", true, "Add", "Close");
      result.then((value) => setEvents(value));
    }
  }

  Widget setEvents(String eventDescription) {
    setState(() {
      _widgets.add(_createListElement(_selectedDate, eventDescription));
    });

    return null;
  }

  Widget _createListElement(DateTime selectedDate, String eventDescription) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: colorNeuWhite,
      child: ListTile(
        leading: Text(
          _selectedDate.day.toString(),
          style: TextStyle(fontSize: 36),
        ),
        title: Text(
          eventDescription,
          style: TextStyle(fontSize: 28),
        ),
        onTap: () => {
          WYSimpleDialog.show<bool>(context, DialogType.yesOrNo, "Delete",
                  "Sure?", true, "Yes", "No")
              .then((value) => {if (value) {} else {}})
        },
      ),
    );
  }

  void _loadEvents() {}
}
