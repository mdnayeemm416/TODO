import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

moveto(
    String title,
    String description,
    String date,
    String deadLineDate,
    String startTime,
    String endTime,
    String collectionName,
    BuildContext context) {
  try {
    CollectionReference completedTask =
        FirebaseFirestore.instance.collection(collectionName);
    Map<String, dynamic> dataToMove = {
      "title": title,
      "Description": description,
      "Date": date,
      "DeadLineDate": deadLineDate,
      "StartTime": startTime,
      "EndTime": endTime,
    };
    completedTask.add(dataToMove);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Task Completed")));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error")));
  }
}

delete(String docName, String collectionName, BuildContext context) {
  try {
    FirebaseFirestore.instance.collection(collectionName).doc(docName).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task Successfully Deleted")));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error")));
  }
}

Future<void> updateTask(
    String task,
    String title,
    String description,
    String date,
    String deadLineDate,
    String startTime,
    String endTime,
    String collectionName,
    BuildContext context) async {
  try {
    // Get the reference to the Firestore document
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(collectionName).doc(task);

    await documentReference.update({
      "title": title,
      "Description": description,
      "Date": date,
      "DeadLineDate": deadLineDate,
      "StartTime": startTime,
      "EndTime": endTime,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task updated successfully'),
      ),
    );
    Navigator.pop(context);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error')),
    );
  }
}
