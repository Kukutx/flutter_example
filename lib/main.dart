import 'package:flutter/material.dart';
import 'package:flutter_rat_remote/componets/sidebar-componets/screen/sidebar_screen.dart';
import 'package:flutter_rat_remote/pages/audio_page.dart';
import 'package:flutter_rat_remote/pages/bottomBar_page.dart';
import 'package:flutter_rat_remote/pages/control_page.dart';
import 'package:flutter_rat_remote/pages/video_page.dart';
import 'package:flutter_rat_remote/componets/home-componets/screen/tasks_screen.dart';


void main() => runApp(
    const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {                               // 路由
        BottomBarPageRoute.routeName: (context) =>
            const BottomBarPageRoute(),
        VideoPageRoute.routeName: (context) =>
            const VideoPageRoute(),
        AudioPageRoute.routeName: (context) =>
            const AudioPageRoute(),
        ControlPanelPageRoute.routeName: (context) =>
            const ControlPanelPageRoute(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(              // 添加侧边导航栏     
        child: MyDrawer(),               //添加侧滑菜单Widget
      ),
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(widget.title),
      ),
      body: const Center(
        child: TaskScreen(),                   // 主界面和上拉框
      ),
    );
  }
}