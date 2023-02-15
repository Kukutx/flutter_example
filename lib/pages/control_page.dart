import 'package:flutter/material.dart';





class ControlPanelPageRoute extends StatelessWidget {
  const ControlPanelPageRoute({super.key});

  static const routeName = '/control_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ControlPanel Page"),
      ),
      body: const Center(
        child: Text("待开发"),
      ),
    );
  }
}
