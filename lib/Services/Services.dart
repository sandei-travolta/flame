import 'package:flame/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
Constants _constants=Constants();
class Services{
  List TasksLists=[];
  List FilteredList=[];
 final _box=Hive.box(_constants.databaseName);
 Future<void> createTask(Map<String,dynamic> newItem,BuildContext context) async{
   await _box.add(newItem);
   print("Task added");
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           backgroundColor: Colors.black,
           content: Text("Task Updated")));
   /*refreshTasks();*/
 }
  Future<List> refreshTasks() async {
    final List<Map<String, dynamic>> _task = _box.keys.map((Key) {
      final item = _box.get(Key);
      return {
        "key": Key,
        _constants.tasktittle: item[_constants.taskDecription],
        _constants.startTime: item[_constants.stopTime]
      };
    }).toList();
    TasksLists = _task.reversed.toList();
    return TasksLists;
  }
  Future<void> updateTask(Map<String,dynamic> item,int itemKey,BuildContext context)async{
    await _box.put(itemKey, item);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
        content: Text("Task Updated")));
    refreshTasks();
  }
  Future<void> deleteTask(int itemKey)async{
   await _box.delete(itemKey);
  }
  Future<void> filterTasks(DateTime currentDate) async {
    final _task = _box.keys.map((Key) {
      final item = _box.get(Key);
      final DateTime taskTime = item["time"]; // Assuming "time" is the field in your task
      // Check if the task's time matches the currentDate
      if (taskTime != null && taskTime.year == currentDate.year && taskTime.month == currentDate.month && taskTime.day == currentDate.day) {
        return {"key": Key, "name": item["name"], "quantity": item["quantity"], "time": taskTime};
      } else {
        return null; // Task doesn't match the desired date
      }
    }).where((task) => task != null).toList();

    TasksLists = _task.reversed.toList();
  }

  Future<void> addCategory()async{

  }
}