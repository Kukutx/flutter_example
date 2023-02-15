import 'package:flutter/material.dart';
import '../widgets/task_title.dart';



// 主页面
class TaskList extends StatelessWidget {
  TaskList({super.key,required this.TaskListItem});
  List<String> TaskListItem = <String>[];                      // 列表元素

  final ScrollController _homeController = ScrollController(); // 给列表添加滚动

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _homeController,
      padding: const EdgeInsets.all(8),
      itemCount: TaskListItem.length,
      itemBuilder: (BuildContext context, int index) {
        // return const CheckBoxRoute();
        return const SwitchRoute();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1),
    );
  }
}
