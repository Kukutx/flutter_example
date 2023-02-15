/// Created by RongCheng on 2022/3/2.

import 'package:flutter/material.dart';
import '../page/detail_page.dart';
import '../utils/audio_player.dart';
import '../utils/music_data_util.dart';
import '../widgets/music_item.dart';
import '../model/music_model.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> with AutomaticKeepAliveClientMixin{

  late List<MusicModel> _data;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // 初始化
    _data = MusicDataUtil.getMusicData();
    super.initState();

    // 播放状态监听
    AudioPlayerUtil.statusListener(key: this, listener: (sate){
      if(mounted){
        setState(() {});
      }
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("单曲播放"),),
      body: ListView.separated(
        padding: const EdgeInsets.only(bottom: 60),
        itemCount: _data.length,
        itemBuilder: (ctx,index) => MusicItem(model: _data[index],callback:(type){
          itemCallback(_data[index], type);
        },),
        separatorBuilder: (ctx,index) => const Divider(height: 0.0,),
      ),
    );
  }

  void itemCallback(MusicModel model,int type){
    if(type == 0){ // 进入详情
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailPage(musicModel: model),
      ));
    }else{  // 点击按钮
      AudioPlayerUtil.playerHandle(model: model);
      if(mounted){
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    // 销毁
    AudioPlayerUtil.removeStatusListener(this);
    super.dispose();
  }
}
