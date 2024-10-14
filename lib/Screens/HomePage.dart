import 'package:flame/Screens/CalenderPage.dart';
import 'package:flame/Screens/NotesPage.dart';
import 'package:flame/Screens/TasksPage.dart';
import 'package:flame/Screens/TodaysPage.dart';
import 'package:flame/Screens/Widgets/BottomSheet.dart';
import 'package:flutter/material.dart';

import '../utils/Colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage=0;
  List _pages=[
    TasksPage(),
    TodaysPage(),
    CalenderPage(),
    NotesPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        decoration: BoxDecoration(
          color: navColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 25,),
            Column(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _currentPage=0;
                  });
                }, icon: Icon(Icons.home,color: _currentPage==0?iconColor.withOpacity(0.5):iconColor,size: 30,)),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: _currentPage==0?Colors.black:navColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            const SizedBox(width: 25,),
            Column(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _currentPage=1;
                  });
                }, icon: Icon(Icons.calendar_today,color: _currentPage==1?iconColor.withOpacity(0.5):iconColor,size: 25,)),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: _currentPage==1?Colors.black:navColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            const SizedBox(width: 25,),
            Column(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _currentPage=2;
                  });
                }, icon: Icon(Icons.calendar_month,color: _currentPage==2?iconColor.withOpacity(0.5):iconColor,size: 30,)),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: _currentPage==2?Colors.black:navColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            const SizedBox(width: 25,),
            Column(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _currentPage=3;
                  });
                }, icon: Icon(Icons.edit_note_rounded,color: _currentPage==3?iconColor.withOpacity(0.5):iconColor,size: 30,)),
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: _currentPage==3?Colors.black:navColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(

      onPressed: (){
        customBottomSheet(context);
      },
      child: Icon(
        Icons.add
      ),
      shape: CircleBorder(),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: _pages[_currentPage],
    );
  }
}
