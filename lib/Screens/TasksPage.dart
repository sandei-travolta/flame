import 'dart:developer';

import 'package:flame/Screens/Widgets/NavBar.dart';
import 'package:flame/Screens/Widgets/Quotes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../Services/Services.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late List<dynamic> _tasks = [];
  late Services services;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*services=Services();
    setState(() {
      services.refreshTasks();
      services.TasksLists=_tasks;
    });*/
    fetcTasks();
    print("lenght=${_tasks.length}");
  }
  void fetcTasks()async{
    Services services=Services();
    List taskList= await services.refreshTasks();
    setState(() {
      _tasks=taskList;
    });

}
  @override
  Widget build(BuildContext context) {
    int day=DateTime.now().weekday;
    String _currentdate=DateFormat("dd MMM").format(DateTime.now());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50,),
        NavBar(day: day, currentdate: _currentdate),
        const SizedBox(height: 20,),
        QuotesWidget(),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Todays Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0 ),
          child: Container(
            height: 390,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder:(context,index){
              return ListTile(
                leading: Text("hello world",style: TextStyle(color: Colors.black),),
              );
            } ),
          ),
        )
      ],
    );
  }
}

