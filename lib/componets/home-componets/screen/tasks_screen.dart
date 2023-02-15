import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';

final ValueNotifier<int> _counter = ValueNotifier<int>(0);     // 变量监听器
final List<String> TaskListItem = <String>[];                  // 列表元素

// 监听器
class ListenList extends StatelessWidget {
  const ListenList({super.key, required this.counterValueNotifier});

  final ValueNotifier<int> counterValueNotifier;               // 计数器


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // [AnimatedBuilder] 接受任何 [Listenable] 监听器.
      animation: counterValueNotifier,
      builder: (BuildContext context, Widget? child) {
        return TaskList(TaskListItem: TaskListItem,);
      },
    );
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => const AddTaskScreen());
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.sunny,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '12 Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                // child: TaskList(), // 添加主页面的 list元素
                child:
                    ListenList(counterValueNotifier: _counter), // 添加主页面的 list元素
              ),
            )
          ],
        ));
  }
}


// 上拉框
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskScreenButton createState() => _AddTaskScreenButton();
}

class _AddTaskScreenButton extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            const TextField(
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  int counter =_counter.value;
                  TaskListItem.add('item($counter)');
                  debugPrint(TaskListItem.toString());             // debug输出
                  _counter.value++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
