import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class PeriodCalendarPage extends StatelessWidget {
  final DateTime? selectedDate;
  final int periodLength;
  final int cycleLength;

  const PeriodCalendarPage({
    Key? key,
    required this.selectedDate,
    required this.periodLength,
    required this.cycleLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the period start dates for the upcoming three months
    List<DateTime> periodStartDates = [];
    DateTime lastPeriodDate = selectedDate ?? DateTime.now();
    for (int i = 0; i < 3; i++) {
      lastPeriodDate = lastPeriodDate.add(Duration(days: cycleLength));
      periodStartDates.add(lastPeriodDate);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Period Calendar',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              for (int i = 0; i < periodStartDates.length; i++)
                _buildCalendar(periodStartDates[i], periodLength),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar(DateTime startDate, int periodLength) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMM yyyy').format(startDate),
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        TableCalendar(
          firstDay: DateTime(startDate.year, startDate.month - 1),
          lastDay: DateTime(startDate.year, startDate.month + 1),
          focusedDay: startDate,
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(fontSize: 18.0),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.red.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),
          selectedDayPredicate: (day) {
            // Mark days of the period
            DateTime periodStart = startDate;
            DateTime periodEnd = startDate.add(Duration(days: periodLength - 1));
            return day.isAfter(periodStart.subtract(Duration(days: 0))) &&
                day.isBefore(periodEnd.add(Duration(days: 1)));
          },
          headerVisible: false, // Remove the two-week header
          // Function to mark ovulation days
          eventLoader: (date) {
            if (_isOvulationDay(startDate, date, cycleLength)) {

              return [CustomOvulationMarker()]; // Return custom ovulation marker
            }
            return []; // Return empty list for non-ovulation days
          },
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  // Function to check if a given day is an ovulation day
  bool _isOvulationDay(DateTime periodStart, DateTime date, int cycleLength) {
    // Ovulation occurs around the middle of the cycle
    DateTime ovulationDay = periodStart.add(Duration(days: cycleLength ~/ 2));
    // Check if the current date is close to the calculated ovulation day
    return date.difference(ovulationDay).inDays.abs() <= 2;
  }
}

// Custom widget for representing the ovulation marker
class CustomOvulationMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.red, // Green color for ovulation marker
        shape: BoxShape.circle,
      ),
    );
  }
}
