import 'package:flame/Screens/Widgets/TextWidgets.dart';
import 'package:flame/utils/Colors.dart';
import 'package:flutter/material.dart';

import '../Helpers/getDay.dart';
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.day,
    required String currentdate,
  }) : _currentdate = currentdate;

  final int day;
  final String _currentdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: navColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  DateText(currentdate: getDay(day)??""),
                  DateText(currentdate: _currentdate)
                ],
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color2,
                ),
                child: Center(
                  child: Icon(Icons.calendar_month_sharp,size: 30,color: iconColor,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
