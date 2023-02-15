import 'package:flutter/material.dart';
import 'package:flutter_rat_remote/utils/utils.dart';
import '../componets/audio-componets/widgets/audio_show_veiw.dart';

import '../componets/audio-componets/page/single_page.dart';
import '../componets/audio-componets/page/list_page.dart';

class AudioPageRoute extends StatelessWidget {
  const AudioPageRoute({super.key});

  static const routeName = '/audio_page';
  
  @override
  Widget build(BuildContext context) {
    return const isPlatform(SupportedComponents: AppTabBarWidget(title: 'Video Page'), NoSupportedComponents:NoAudioPlayerPage());
  }
}




class AppTabBarWidget extends StatefulWidget {
  const AppTabBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AppTabBarWidget> createState() => _AppTabBarWidgetState();
}

class _AppTabBarWidgetState extends State<AppTabBarWidget> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  late List<BottomNavigationBarItem> _items;
  late List<Widget> _pages;

  @override
  void initState() {
    _items = [
      AppTabBarItem("单曲"),
      AppTabBarItem("目录"),
    ];
    _pages = [const SinglePage(), const ListPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black45,
        items: _items,
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AudioShowView(
                context: context,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onPageChanged(int index) {
    if (_currentPage != index) {
      setState(() => _currentPage = index);
    }
  }
}

class AppTabBarItem extends BottomNavigationBarItem {
  AppTabBarItem(String title)
      : super(
            icon: title == "单曲"
                ? const Icon(Icons.home_outlined)
                : const Icon(Icons.list),
            activeIcon: title == "单曲"
                ? const Icon(Icons.home)
                : const Icon(Icons.view_list),
            label: title);
}


// http://music.163.com/song/media/outer/url?id=1476450016.mp3


/*
  原链接：获取id

  https://music.163.com/song?id=29984255&userid=267688655
  mp3链接：

  https://music.163.com/song/media/outer/url?id=468176711.mp3

https://music.163.com/song?id=1463165983&userid=567721052
   */


// 如果是不支持的平台
class NoAudioPlayerPage extends StatelessWidget {
  const NoAudioPlayerPage({super.key});

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





