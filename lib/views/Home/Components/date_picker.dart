import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo_app/App_Constant/app_constant.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: AppSize.height150(context),
      width: 70,
      initialSelectedDate: DateTime.now(),
      selectionColor: blueColor,
      selectedTextColor: Colors.white,
    );
  }
}
