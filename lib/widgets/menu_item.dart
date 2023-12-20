import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem {
  static const String completed = "Completed";
  static const String delete = "Delete";
  static const String edit = "Edit";

  static const List<String> choice = [completed, delete, edit];

  static const Map<String, IconData> choiceIcon = {
    completed:FontAwesomeIcons.check,
    delete:FontAwesomeIcons.trash,
    edit:FontAwesomeIcons.penToSquare,

  };
}
