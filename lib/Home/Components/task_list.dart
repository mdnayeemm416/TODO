import 'package:flutter/material.dart';
import 'package:todo_app/App_Constant/app_constant.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: AppSize.height200(context),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Learning web developer",
                      style: mediumText,
                    ),
                    Text(
                      "Learning web developer",
                      style: smallText,
                    ),
                    Text(
                      "Learning web developer",
                      style: smallText,
                    ),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
