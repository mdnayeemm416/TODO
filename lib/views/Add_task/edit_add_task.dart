import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/services/firebase_services.dart';
import 'package:todo_app/controller/Add_Task_Controller/add_task_controller.dart';
import 'package:todo_app/widgets/task_input_field.dart';

class EditAddTask extends StatefulWidget {
  final DocumentSnapshot task;
  const EditAddTask({super.key, required this.task});

  @override
  State<EditAddTask> createState() => _EditAddTaskState();
}

class _EditAddTaskState extends State<EditAddTask> {
  AddTaskController addTaskController = Get.put(AddTaskController());

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController deadLineDate = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();
  @override
  void initState() {
    super.initState();
    title.text = widget.task["title"];
    description.text = widget.task["Description"];
    date.text = widget.task["Date"];
    deadLineDate.text = widget.task["DeadLineDate"];
    startTime.text = widget.task["StartTime"];
    endTime.text = widget.task["EndTime"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Added Task",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: AppSize.height(context),
          width: AppSize.width(context),
          padding: EdgeInsets.symmetric(horizontal: AppSize.height20(context)),
          child: Column(
            children: [
              TaskInputField(
                controller: title,
                title: "Title",
                hint: "Enter the title  here",
              ),
              TaskInputField(
                controller: description,
                title: "Description",
                hint: "Enter the description here",
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TaskInputField(
                        controller: date,
                        title: "Date",
                        hint: DateFormat.yMd().format(DateTime.now()),
                        widget: IconButton(
                          onPressed: () async {
                            await addTaskController.getDateFromUser(context);
                            date.text = DateFormat.yMd()
                                .format(addTaskController.pickedDate!.value);
                          },
                          icon: const Icon(Icons.calendar_today_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TaskInputField(
                        controller: startTime,
                        title: "Time",
                        hint: addTaskController.startTime.value,
                        widget: IconButton(
                          onPressed: () async {
                            await addTaskController.getTimeFromUser(
                                context, true);
                            startTime.text = addTaskController.startTime.value;
                          },
                          icon: const Icon(Icons.access_alarm_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: TaskInputField(
                        controller: deadLineDate,
                        title: "DeadLine Date",
                        hint: DateFormat.yMd().format(
                            addTaskController.pickedDeadLineDate!.value),
                        widget: IconButton(
                          onPressed: () async {
                            await addTaskController
                                .getDeadLineDateFromUser(context);
                            deadLineDate.text = DateFormat.yMd().format(
                                addTaskController.pickedDeadLineDate!.value);
                          },
                          icon: const Icon(Icons.calendar_today_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TaskInputField(
                        controller: endTime,
                        title: "End Time",
                        hint: addTaskController.endTime.value,
                        widget: IconButton(
                          onPressed: () async {
                            await addTaskController.getTimeFromUser(
                                context, false);
                            endTime.text = addTaskController.endTime.value;
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
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15)),
                  onPressed: () {
                    setState(() {});
                    updateTask(
                        widget.task.id,
                        title.text,
                        description.text,
                        date.text,
                        deadLineDate.text,
                        startTime.text,
                        endTime.text,
                        "Task List",
                        context);
                  },
                  child: const Text(
                    "Update Task",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
