import 'package:flutter/material.dart';

// 单选开关和复选框

class CheckBoxRoute extends StatefulWidget {
  const CheckBoxRoute({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskTileCheckBox createState() => _TaskTileCheckBox();
}

class SwitchRoute extends StatefulWidget {
  const SwitchRoute({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskTileSwitch createState() => _TaskTileSwitch();
}

class _TaskTileCheckBox extends State<CheckBoxRoute> {
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('This is a taskCheckBox.'),
        trailing: Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.red, //选中时的颜色
            onChanged: (bool? value) {
              setState(() {
                _checkboxSelected = value!;
              });
            }));
  }
}


class _TaskTileSwitch extends State<SwitchRoute> {
  bool _switchSelected = true; //维护单选开关状态

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('This is a taskSwitch.'),
        trailing: Switch(       // 单选开关
            value: _switchSelected, //当前状态
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
    ));
  }
}


