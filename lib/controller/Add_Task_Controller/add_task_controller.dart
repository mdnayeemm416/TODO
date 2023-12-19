import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskController extends GetxController {
  Rx<DateTime>? pickeddate = DateTime.now().obs;
  Rx<String> starttTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString().obs;
  Rx<String> endTime = "9:30 PM".obs;
  //Get the task date
  Future<void> getdateFromUser(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
        context: context,
        firstDate: DateTime(2015),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (pickeddate != null) {
      pickeddate?.value = pickdate!;
    } else {
      debugPrint("error");
    }
  }

  //Get the task time
  Future<void> gettimeFromUser(BuildContext context, bool isStartTime) async {
    var picktime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 8, minute: 10),
        initialEntryMode: TimePickerEntryMode.input);
    String formatedTime = picktime!.format(context);
    if (isStartTime == true) {
      starttTime.value = formatedTime;
    } else {
      endTime.value = formatedTime;
    }
  }
}
