import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Calender'),
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    todayColor: Colors.tealAccent,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white
                    )
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  onDaySelected: (date, events){
                    print(date.toIso8601String());
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) =>
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text(date.day.toString(), style: TextStyle
                      (color: Colors.blueGrey),)),
                    todayDayBuilder: (context, date, events) =>
                    Container(
                       margin: const EdgeInsets.all(4.0),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.tealAccent,
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       child: Text(date.day.toString(), style: TextStyle
                       (color: Colors.blueGrey),)),
                  ),
              calendarController: _controller,)
              ],
            )
        )
    );
  }
}