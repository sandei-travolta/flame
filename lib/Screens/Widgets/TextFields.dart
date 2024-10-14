import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        readOnly: true,
        controller: dateController,
        decoration: InputDecoration(
          hintText: "Task Date",
        ),
        onTap: ()async{
          DateTime? pickedDate=await showDatePicker(
            context:context,
            initialDate:DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2045),
          );
          if(pickedDate!=null){
            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
            dateController.text=formattedDate;
          }
        },
      ),
    );
  }
}

class TimeSelectorWidget extends StatelessWidget {
  const TimeSelectorWidget({
    super.key,
    required this.startTimeController,
    required this.stopTimeController,
  });

  final TextEditingController startTimeController;
  final TextEditingController stopTimeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 150,
          child: TextField(
            readOnly: true,
            controller: startTimeController,
            decoration: InputDecoration(
                hintText: "Start time"
            ),
            onTap: () async {
              var time=await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context:context,
                  builder: (ctx,child){
                    return MediaQuery(
                        data: MediaQuery.of(ctx).copyWith(
                            alwaysUse24HourFormat: true
                        ),
                        child: child!);
                  }
              );
              if(time!=null){
                startTimeController.text=time.format(context);
              }
            },
          ),
        ),
        Container(
          width: 150,
          child: TextField(
            readOnly: true,
            controller: stopTimeController,
            decoration: InputDecoration(
                hintText: "Stop time"
            ),
            onTap: () async {
              var time=await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context:context,
                  builder: (ctx,child){
                    return MediaQuery(data: MediaQuery.of(ctx).copyWith(
                        alwaysUse24HourFormat: true
                    ), child: child!);
                  }
              );
              if(time!=null){
                stopTimeController.text=time.format(context);
              }
            },
          ),
        )
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.taskNameontroller,this.tittle,this.hint,
  });
  final String? tittle;
  final String? hint;
  final TextEditingController taskNameontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
          controller: taskNameontroller,
          decoration:  InputDecoration(
            labelText: tittle,
            hintText: hint,
          ),
          validator:(value){
            if(value==null||value.trim().isEmpty){
              return "Fieldrequire";
            }
          }
      ),
    );
  }
}