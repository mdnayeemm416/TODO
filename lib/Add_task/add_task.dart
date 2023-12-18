import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/widgets/task_input_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.height20(context)),
        child: Column(
          children: [
            TaskInputField(
              title: "Title",
              hint: "Enter the title  here",
            ),
            TaskInputField(
              title: "Description",
              hint: "Enter the description here",
            ),
            TaskInputField(
              title: "Date",
              hint: DateFormat.yMd().format(DateTime.now()),
            ),
            Row(
              children: [
                Expanded(
                  child: TaskInputField(
                    title: "Date",
                    hint: DateFormat.yMd().format(DateTime.now()),
                  ),
                ),
                Expanded(
                  child: TaskInputField(
                    title: "Date",
                    hint: DateFormat.yMd().format(DateTime.now()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
