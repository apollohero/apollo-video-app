import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_recommend/model/video_item.dart';


import 'package:movie_recommend/public.dart';
import 'video_list_item.dart';
import 'dart:convert';

class VideoListView extends StatefulWidget {

  final String title;
  final String action;

  const VideoListView({Key key, this.title, this.action}) : super(key: key);

  @override
  _VideoListViewState createState() => _VideoListViewState(title, action);
}

class _VideoListViewState extends State<VideoListView> {

  String title;
  String action;
  List<VideoItem> movieList;
  var video_list = {
    "video_list":[
      {
        "id":"10001",
        "cover_img":"http://i2.hdslb.com/bfs/archive/7c758a9316d4a8ed59bb7900b60592acb79d4b36.jpg",
        "title":"【Amily米粒】今天我18岁GIRL了 ❤️ 【成年作】",
        "typename":"宅舞",
        "author":"AZ_VISION视焦",
        "description":"编舞出处: av28358845 MIUME↵摄影: @苍叔CSS↵后期: @Amily米粒赵琪↵后勤: 明空大可爱! 上琴青天小天使!↵↵今天18岁了，谢谢大家一路的支持！一如既往，是17岁那会录的存货～ 一周后发布竖版不一样内容竖频的版本哦～↵↵12.7被标题举报退回了？↵我之前的标题就是18岁成年生日作+歌曲名+一个歌词啊？有问题吗？生日作诶！气鼓鼓"
      },
      {
        "id":"10002",
        "cover_img":"http://i1.hdslb.com/bfs/archive/2deeea757fa660abefdee6fd7e8159b101fff288.jpg",
        "title":"【晓丹】主人，请签收您的粉红兔❀再见，偷花人❀",
        "typename":"宅舞",
        "author":"晓丹小仙女儿",
        "description":"音源：鎖那 - さようなら、花泥棒さん↵编舞：sm28571553↵参考：av7332363↵摄影后期：亦是狂澜"
      },
      {
        "id":"10003",
        "cover_img":"http://i1.hdslb.com/bfs/archive/e170a92698fe5882a5065a4eb4c87c8db109daad.jpg",
        "title":"【海豹粥】恋人募集中（仮）❤好想恋爱噢(*/ω＼*)",
        "typename":"宅舞",
        "author":"海豹味的米粥Kayoo",
        "description":"大小姐刚出这个视频时就觉得超级可爱，之前趁着放假匆匆地学了两个晚上就去录了，结果好多动作都没太记住(；′⌒`)鞋还特别地打滑，于是就又又变成了这样一个卖萌的划水作，对不起大家(＞人＜；)↵编舞出处：sm35799087↵歌曲出处：天月様↵摄影：绯山圣瞳九命猫↵后期：缥缈酱"
      }
    ]
  };
  // 默认加载 20 条数据
  int start = 0, count = 20;

  bool _loaded = false;

  ScrollController _scrollController = ScrollController(); //listview的控制器

  _VideoListViewState(this.title, this.action);

  @override
  void initState() {
    super.initState();
    fetchData();
    // 滚动监听注册
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print('滑动到了最底部');
        fetchData();
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(title+'社区'),
          backgroundColor: AppColor.white,
          elevation: 0,
        ),
        body: _buildBody()
    );
  }

  // 返回上个页面
  back() {
    Navigator.pop(context);
  }

  Widget _buildBody() {
    if (movieList == null) {
      return Center(
        child: CupertinoActivityIndicator(
        ),
      );
    }
    return Container(
      child: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index+1 == movieList.length) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Offstage(
                  offstage: _loaded,
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          }
          return  VideoListItem(movieList[index], action);
        },
        controller: _scrollController,
      ),
    );
  }


  Future<void> fetchData() async {
    if (_loaded) {
      return;
    }
    ApiClient client = new ApiClient();
    var data;
    switch (action) {
      case 'video':
        data = await client.getVideoList(start: start,count: count);
        break;


    }
    setState(() {
      if (movieList == null) {
        movieList = [];
      }
      List<VideoItem> newMovies = getVideoList(data);
      if (newMovies.length == 0) {
        _loaded = true;
        return;
      }
      newMovies.forEach((movie) {
        movieList.add(movie);
      });

      start = start + count;
    });
  }

  List<VideoItem> getVideoList(var list) {
    List content = list;
    List<VideoItem> movies = [];
    content.forEach((data) {
//      movies.add(VideoItem.fromJson(data));
    });
    return movies;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}