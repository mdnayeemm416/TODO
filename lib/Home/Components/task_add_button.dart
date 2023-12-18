import 'package:flutter/material.dart';
import 'package:todo_app/Add_task/add_task.dart';
import 'package:todo_app/App_Constant/app_constant.dart';

class TaskAddButton extends StatelessWidget {
  const TaskAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: blueColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const AddTask()));
        },
        child: const Text(
          "+ Add",
          style: TextStyle(color: Colors.white),
        ));
  }
}
