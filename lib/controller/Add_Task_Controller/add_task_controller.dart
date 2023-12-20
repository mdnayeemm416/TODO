import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskController extends GetxController {
  Rx<DateTime>? pickedDate = DateTime.now().obs;
  Rx<DateTime>? pickedDeadLineDate = DateTime.now().obs;
  Rx<String> startTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString().obs;
  Rx<String> endTime = "9:30 PM".obs;
  //Get the task date
  Future<void> getDateFromUser(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2015),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (pickedDate != null) {
      pickedDate?.value = pickDate!;
    } else {
      debugPrint("error");
    }
  }

  //Get the DeadLine Date
    Future<void> getDeadLineDateFromUser(BuildContext context) async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2015),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (pickedDeadLineDate != null) {
      pickedDeadLineDate?.value = pickDate!;
    } else {
      debugPrint("error");
    }
  }

  //Get the task time
  Future<void> getTimeFromUser(BuildContext context, bool isStartTime) async {
    var pickTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split(" ")[0])),
        initialEntryMode: TimePickerEntryMode.input);
    String formatTime = pickTime!.format(context);
    if (isStartTime == true) {
      startTime.value = formatTime;
    } else {
      endTime.value = formatTime;
    }
  }
}
