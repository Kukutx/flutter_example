import 'package:flutter/material.dart';

class BottomBarPageRoute extends StatelessWidget {
  const BottomBarPageRoute({super.key});

  static const routeName = '/bottomBar_page';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.

    return const BottomBarPage(title: 'BottomBar Page');
  }
}

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key, required this.title});
  final String title;

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  // 底部菜单栏
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Center(
      child: Text(
        'Index 0: Home',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Index 1: Business',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ),
    const MyListView(),
    const Center(
      child: Text(
        'Index 4: Settings',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 4:
          showModal(context);
          break;
      }
    });
  }

  // 打开模态框
  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  // 某种程度上类似 Qt的构造函数
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(widget.title),
      ),
      // body: _listViewBody(),
      body: _widgetOptions.elementAt(_selectedIndex),
      // 底部菜单栏
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // 选项卡选项
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // 属性定义
  final List<String> entries = <String>[];
  int _counter = 0;

  final ScrollController _homeController = ScrollController(); // 给列表添加滚动

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                controller: _homeController,
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  // return const CheckBoxRoute();   // 可作为参考
                  return Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      // color: Colors.amber[colorCodes[index]],
                      color: Colors.blue,
                      child: Center(
                          child: Text('Entry ${entries[index]} Item $index')));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(thickness: 1)),
          ),
          ElevatedButton(
              child: const Text(
                'meno',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (_counter > 0) {
                    entries.remove(entries[_counter - 1]);
                    _counter--;
                  }
                });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            entries.add('Someone($_counter)');
            _counter++;
          });
        },
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
