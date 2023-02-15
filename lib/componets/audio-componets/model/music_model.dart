// 音乐格式
class MusicModel{
  late int id;
  late String name;
  late String author;
  late String thumbnail;
  late String url;

  MusicModel.fromMap(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"];
    author = json["author"];
    thumbnail = json["thumbnail"];
    url = json["url"];
  }
}

