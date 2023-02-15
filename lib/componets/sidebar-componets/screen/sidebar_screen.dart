import 'package:flutter/material.dart';
import 'package:flutter_rat_remote/pages/audio_page.dart';
import 'package:flutter_rat_remote/pages/bottomBar_page.dart';
import 'package:flutter_rat_remote/pages/control_page.dart';
import 'package:flutter_rat_remote/pages/route_page.dart';
import 'package:flutter_rat_remote/pages/video_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyMyDrawerState createState() => _MyMyDrawerState();
}

// 针对 主页与侧边栏分离决定
class _MyMyDrawerState extends State<MyDrawer> {
  // 侧边导航栏头部-自定义
  Widget _buildCustomDrawerHeader() {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://img2.woyaogexing.com/2018/08/13/4c5831dec5a141b6b3dc1a07d2970ada!600x600.jpeg"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 40.0, left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: const <Widget>[Text("UserName")],
                ),
                Row(
                  children: const <Widget>[
                    Text("user introduction"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // // 侧边导航栏头部-基础
  // Widget _buildUserAccountDrawerHeader() {
  //   return UserAccountsDrawerHeader(
  //     //系统提供的一种DrawerHeader layout样式
  //     accountName: const Text("Thai"), //用户名
  //     accountEmail: const Text("Thai@gmail.com"), //用户邮箱
  //     currentAccountPicture: Image.network(
  //       //头像
  //       "https://img2.woyaogexing.com/2018/08/13/4c5831dec5a141b6b3dc1a07d2970ada!600x600.jpeg",
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  // 侧边导航栏的列表
  Widget _buildDrawerBody() {
    return Column(
      //列控件
      children: <Widget>[
        ListTile(
          title: const Text("Ttem 1"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstRoute()),
            );
          },
        ),
        ListTile(
          title: const Text("Item 2"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.pages_rounded),
          title: const Text("buttomBar Pages"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
                context, BottomBarPageRoute.routeName); //跳转到新页面，将当前页面加入回退栈
          },
        ),
        ListTile(
          leading: const Icon(Icons.video_call),
          title: const Text("video"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
                context, VideoPageRoute.routeName); //跳转到新页面，将当前页面加入回退栈
          },
        ),
        ListTile(
          leading: const Icon(Icons.music_note),
          title: const Text("audio"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
                context, AudioPageRoute.routeName); //跳转到新页面，将当前页面加入回退栈
          },
        ),
        ListTile(
          leading: const Icon(Icons.web),
          title: const Text("Control"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
                context, ControlPanelPageRoute.routeName); //跳转到新页面，将当前页面加入回退栈
          },
        ),
        ListTile(
          leading: const Icon(Icons.web),
          title: const Text("Control"),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(
                context, ControlPanelPageRoute.routeName); //跳转到新页面，将当前页面加入回退栈
          },
        ),
      ],
    );
  }

  // 侧边导航栏
  Widget buildDrawer(BuildContext context) {
    return ListView(
      children: <Widget>[
        // _buildUserAccountDrawerHeader(),
        _buildCustomDrawerHeader(),
        _buildDrawerBody(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }
}
