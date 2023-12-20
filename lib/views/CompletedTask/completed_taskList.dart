import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/services/firebase_services.dart';


class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskListState();
}

class _CompletedTaskListState extends State<CompletedTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Completed Task",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: blueColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Completed Task")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final completedTaskList = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: completedTaskList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: AppSize.height200(context),
                      margin: const EdgeInsets.all(10),
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
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                completedTaskList[index]["title"],
                                style: mediumText,
                              ),
                              SizedBox(
                                  width: AppSize.width(context) * .65,
                                  child: Text(
                                      completedTaskList[index]["Description"])),
                              Text(
                                "${completedTaskList[index]["Date"]}  "
                                "${completedTaskList[index]["StartTime"]}",
                                style: smallText,
                              ),
                              Text(
                                "DeadLine Date: ${completedTaskList[index]["DeadLineDate"]}  "
                                "${completedTaskList[index]["EndTime"]}",
                                style: smallText,
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              delete(completedTaskList[index].id,
                                  "Completed Task", context);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: blueColor,
                            ))
                      ]),
                    );
                  });
            }
          }),
    );
  }
}
