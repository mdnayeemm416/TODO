import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/App_Constant/app_constant.dart';
import 'package:todo_app/Home/Components/date_picker.dart';
import 'package:todo_app/Home/Components/task_add_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AppSize.height20(context)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: mediumText,
                    ),
                    const Text(
                      "Today",
                      style: largeText,
                    )
                  ],
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              const DatePickerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
