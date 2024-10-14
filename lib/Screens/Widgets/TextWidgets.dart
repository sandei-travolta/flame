import 'package:flutter/material.dart';

import '../../utils/Colors.dart';
class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required String currentdate,
  }) : _currentdate = currentdate;

  final String _currentdate;

  @override
  Widget build(BuildContext context) {
    return Text(_currentdate,style: TextStyle(color: textColor,fontWeight: FontWeight.w600,fontSize: 20),);
  }
}
class TasksText extends StatelessWidget {
  const TasksText({
    super.key,
    required String currentdate,
  }) : _currentdate = currentdate;

  final String _currentdate;

  @override
  Widget build(BuildContext context) {
    return Text(_currentdate,style: TextStyle(color: textColor,fontWeight: FontWeight.w600,fontSize: 15),);
  }
}
class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required String currentdate,
  }) : _currentdate = currentdate;

  final String _currentdate;

  @override
  Widget build(BuildContext context) {
    return Text(_currentdate,style: TextStyle(color: textColor,fontWeight: FontWeight.w600,fontSize: 25),);
  }
}
