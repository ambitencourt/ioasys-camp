import 'package:flutter/material.dart';
import '../../components/input_task_widget.dart';
import '../../components/list_task_widget.dart';
import '../../controller/todo_controller.dart';
import '../../shared/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ToDoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lista de Tarefas',
        image: Image.asset('assets/images/logo.png'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 24, 17, 40),
            child: InputTaskWidget(
              textController: controller.textController,
              onPressed: () {
                setState(() {
                  controller.addToDo();
                });
              },
              labelText: 'Nova Tarefa',
              textButton: 'ADD',
            ),
          ),
          Expanded(
            child: ListTaskWidget(
              listToDo: controller.listToDo,
              onChanged: (value, index) => setState(() {
                controller.updateStatus(value, index);
              }),
              onRemoved: (index) {
                setState(() {
                  controller.onRemoveTaskOfList(index);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
