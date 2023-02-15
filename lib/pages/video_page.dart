import 'package:flutter/material.dart';
import 'package:flutter_rat_remote/utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPageRoute extends StatelessWidget {
  const VideoPageRoute({super.key});
  static const routeName = '/video_page';
  
  @override
  Widget build(BuildContext context) {
    // 判断平台是否可加载组件
    return const isPlatform(SupportedComponents: VideoPlayerScreen(title: 'Video Page'), NoSupportedComponents:NoVideoPlayerPage());
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.title});
  final String title;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController
      _controller; // 创建并初始化 VideoPlayerController，允许你播放不同类型的视频并进行播放控制。
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // nitState 方法里创建和初始化控制器
    super.initState();
    // 创建并存储 VideoPlayerController。 VideoPlayerController，提供了几种不同的构造函数来播放来自资产、文件的视频， 或互联网。
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture =
        _controller.initialize(); // 初始化控制器并存储 Future 供以后使用。
    _controller.setLooping(true); // 使用控制器循环播放视频。
  }

  @override
  void dispose() {
    // dispose 方法里销毁控制器
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        // 展示视频播放器
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child:
                  CircularProgressIndicator(), // 如果 VideoPlayerController 仍在初始化，则显示，加载微调器。
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        //播放视频和暂停视频
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}


// 如果是不支持的平台
class NoVideoPlayerPage extends StatelessWidget {
  const NoVideoPlayerPage({super.key});

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
