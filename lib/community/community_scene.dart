import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_recommend/community/video_list_view.dart';

import 'package:movie_recommend/public.dart';

import 'community_list_view.dart';


class CommunityScene extends StatefulWidget {
  final Widget child;

  CommunityScene({Key key, this.child}) : super(key: key);

  _CommunitySceneState createState() => _CommunitySceneState();
}



class _CommunitySceneState extends State<CommunityScene> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  VideoListView(title: "自由上传视频",action: 'video')
    ;
  }
}

