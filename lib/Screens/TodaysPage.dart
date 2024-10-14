import 'package:flame/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class TodaysPage extends StatelessWidget {
  const TodaysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              color: calenderColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Container(
                  height: 210,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SfCalendar(
                        view: CalendarView.month,
                        initialDisplayDate: DateTime.now(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
