import 'package:flutter/material.dart';

import '../models/task_model.dart';

class ToDoController {
  TextEditingController textController = TextEditingController();
  List<TaskModel> listToDo = [];

  void addToDo() {
    if (textController.text.isNotEmpty) {
      var newTask = TaskModel(description: textController.text);
      listToDo.add(newTask);
      textController.text = '';
    }
  }

  void updateStatus(bool? value, int index) {
    listToDo[index].completed = value ?? false;
  }

  void onRemoveTaskOfList(int index) {
    listToDo.removeAt(index);
  }
}
