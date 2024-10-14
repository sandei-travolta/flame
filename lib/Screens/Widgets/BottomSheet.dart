import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Services/Services.dart';
import 'TextFields.dart';
import 'TextWidgets.dart';
void customBottomSheet(BuildContext context){
  final GlobalKey<FormState> _globalKey=GlobalKey();
  TextEditingController taskNameontroller=TextEditingController();
  TextEditingController taskDescription=TextEditingController();
  TextEditingController startTimeController=TextEditingController();
  TextEditingController stopTimeController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  Services service=Services();
 showModalBottomSheet(
     elevation: 5,
     isScrollControlled: true,
     context: context, builder:(_){
   return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(12),
         topRight: Radius.circular(12)
       ),
     ),
     height: 600,
     width: double.infinity,
     child: Form(
       key: _globalKey,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           const SizedBox(height: 25,),
           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               TitleText(currentdate: "Add Task")
             ],
           ),
           CustomTextField(taskNameontroller: taskNameontroller,hint: "Task Tittle",tittle: "Tittle",),
           const SizedBox(height: 10,),
           CustomTextField(taskNameontroller: taskDescription,hint: "Task Description",tittle: "Description",),
           const SizedBox(height: 10,),
           TimeSelectorWidget(startTimeController: startTimeController, stopTimeController: stopTimeController),
           const SizedBox(height: 10,),
           DatePickerWidget(dateController: dateController),
           const SizedBox(height: 50,),
           ElevatedButton(onPressed: ()async{
             service.createTask({
               "tittle":taskNameontroller.text,
               "description":taskDescription.text,
               "start_time":startTimeController.text,
               "stop_time":stopTimeController.text,
               "date":dateController.text
             },context);
             taskNameontroller.clear();
             taskDescription.clear();
             startTimeController.clear();
             stopTimeController.clear();
             dateController.clear();
             ;
           }, child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
             child: Text("Add task"),
           ))
         ],
       ),
     ),
   );
 });
}

