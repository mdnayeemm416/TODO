import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/controller/Add_Task_Controller/add_task_controller.dart';
import 'package:todo_app/widgets/task_input_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  AddTaskController addTaskController = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppSize.height(context),
          width: AppSize.width(context),
          padding: EdgeInsets.symmetric(horizontal: AppSize.height20(context)),
          child: Column(
            children: [
              const TaskInputField(
                title: "Title",
                hint: "Enter the title  here",
              ),
              const TaskInputField(
                title: "Description",
                hint: "Enter the description here",
              ),
              Obx(
                () => TaskInputField(
                  title: "Date",
                  hint: DateFormat.yMd()
                      .format(addTaskController.pickeddate!.value),
                  widget: IconButton(
                    onPressed: () {
                      addTaskController.getdateFromUser(context);
                    },
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                ),
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TaskInputField(
                        title: "Start Time",
                        hint: addTaskController.starttTime.value,
                        widget: IconButton(
                          onPressed: () {
                            addTaskController.gettimeFromUser(context, true);
                          },
                          icon: const Icon(Icons.access_alarm_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TaskInputField(
                        title: "End Time",
                        hint: addTaskController.endTime.value,
                        widget: IconButton(
                          onPressed: () {
                            addTaskController.gettimeFromUser(context, false);
                          },
                          icon: const Icon(Icons.access_alarm_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20)),
                  onPressed: () {},
                  child: const Text(
                    "Creat Task",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
