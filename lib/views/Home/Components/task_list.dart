import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/services/firebase_services.dart';
import 'package:todo_app/views/Add_task/edit_add_task.dart';
import 'package:todo_app/widgets/menu_item.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Task List")
            .orderBy("DeadLineDate")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final taskList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: AppSize.height200(context),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 220, 216, 216),
                        blurRadius: 1,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 252, 251, 251),
                        blurRadius: 1,
                      )
                    ], borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        width: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskList[index]["title"],
                              style: mediumText,
                            ),
                            Container(
                                width: AppSize.width(context) * .65,
                                child: Text(taskList[index]["Description"])),
                            Text(
                              "${taskList[index]["Date"]}  " +
                                  "${taskList[index]["StartTime"]}",
                              style: smallText,
                            ),
                            Text(
                              "DeadLine Date: ${taskList[index]["DeadLineDate"]}  " +
                                  "${taskList[index]["EndTime"]}",
                              style: smallText,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: PopupMenuButton(itemBuilder: (context) {
                          return MenuItem.choice.map((String choice) {
                            return PopupMenuItem(
                                value: choice,
                                child: ListTile(
                                  title: Text(
                                    choice,
                                    style: smallText,
                                  ),
                                  leading: Icon(
                                    MenuItem.choiceIcon[choice],
                                    size: 15,
                                  ),
                                ));
                          }).toList();
                        }, onSelected: (String choice) {
                          if (choice == MenuItem.completed) {
                            moveto(
                                taskList[index]["title"],
                                taskList[index]["Description"],
                                taskList[index]["Date"],
                                taskList[index]["DeadLineDate"],
                                taskList[index]["StartTime"],
                                taskList[index]["EndTime"],
                                "Completed Task",
                                context);
                            delete(taskList[index].id, "Task List", context);
                          } else if (choice == MenuItem.delete) {
                            delete(taskList[index].id, "Task List", context);
                          } else if (choice == MenuItem.edit) {
                            Get.to(EditAddTask(task:taskList[index]));
                          }
                        }),
                      )
                    ]),
                  );
                });
          }
        });
  }
}
