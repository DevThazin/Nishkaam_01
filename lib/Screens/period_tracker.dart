import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'Period_Calendar.dart';

class PeriodTrackerHomePage extends StatefulWidget {
  @override
  _PeriodTrackerHomePageState createState() => _PeriodTrackerHomePageState();
}

class _PeriodTrackerHomePageState extends State<PeriodTrackerHomePage> {
  DateTime? _selectedDate;
  int _periodLength = 4;
  int _cycleLength = 28;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Track Your Period',style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Date of your last period?    ',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate != null
                                  ? DateFormat('dd-MMM').format(_selectedDate!)
                                  : ' ',
                              style: TextStyle(fontSize: 20.0,color: Color(0xFF658C4A),),
                            ),
                            Icon(Icons.calendar_today,color: Color(0xFF658C4A)),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 5.0,
                child: Container(
                  height: 200.0,
                  width: 200,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'How long does your period last?',
                        style: TextStyle(
                          fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove,color: Color(0xFF658C4A),),
                            onPressed: () {
                              setState(() {
                                if (_periodLength > 0) _periodLength--;
                              });
                            },
                          ),
                          Text(
                            '$_periodLength',
                            style: TextStyle(fontSize: 18.0,color: Color(0xFF658C4A),),
                          ),
                          IconButton(
                            icon: Icon(Icons.add,color: Color(0xFF658C4A),),
                            onPressed: () {
                              setState(() {
                                _periodLength++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 5.0,
                child: Container(
                  height: 200.0,
                  width: 200,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What\'s your usual cycle length?',
                        style: TextStyle(
                          fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove,color: Color(0xFF658C4A),),
                            onPressed: () {
                              setState(() {
                                if (_cycleLength > 0) _cycleLength--;
                              });
                            },
                          ),
                          Text(
                            '$_cycleLength',
                            style: TextStyle(fontSize: 18.0,color: Color(0xFF658C4A),),
                          ),
                          IconButton(
                            icon: Icon(Icons.add,color: Color(0xFF658C4A),),
                            onPressed: () {
                              setState(() {
                                _cycleLength++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PeriodCalendarPage(
                        selectedDate: _selectedDate,
                        periodLength: _periodLength,
                        cycleLength: _cycleLength,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Track Now',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF658C4A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

