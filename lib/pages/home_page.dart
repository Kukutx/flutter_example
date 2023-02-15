import 'package:flutter/material.dart';
import 'package:flutter_rat_remote/componets/home-componets/screen/tasks_screen.dart';

class HomePageRoute extends StatelessWidget {
  const HomePageRoute({super.key});
  static const routeName = '/video_page';

  @override
  Widget build(BuildContext context) {
    // 判断平台是否可加载组件
    // return const isPlatform(SupportedComponents: VideoPlayerScreen(title: 'Video Page'), NoSupportedComponents:NoVideoPlayerPage());
    return const HomePageScreen(title: 'Home Page',);
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.title});
  final String title;
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}


class _HomePageScreenState extends State<HomePageScreen> {
  // ignore: unused_field
  static const routeName = '/Home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Page"),
      ),
      body: const Center(
        child: TaskScreen(),
      ),
    );
  } 
}
  




// 如果是不支持的平台
class NoHomePageScreenPage extends StatelessWidget {
  const NoHomePageScreenPage({super.key});

  static const routeName = '/video_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Page"),
      ),
      body: const Center(
        child: Text("暂不支持 Windows,Linux,MacOS"),
      ),
    );
  }
}
