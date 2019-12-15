import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_recommend/model/video_detail.dart';



import 'package:movie_recommend/public.dart';

class VideoDetailHeader extends StatelessWidget {

  final VideoDetail videoDetail;
  final Color coverColor;

  const VideoDetailHeader(this.videoDetail, this.coverColor);

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;

    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(videoDetail.photos[0].image),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Opacity(
            opacity: 0.7,
            child: Container(color: coverColor, width: width, height: height),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              ],
            ),
          ),
        ],
      ),
    );
  }

  String actor2String(List<MovieActor> actors) {
    StringBuffer sb = new StringBuffer();
    actors.forEach((actor) {
      sb.write(' ${actor.name} ');
    });
    return sb.toString();
  }

  String list2String(List list) {
    StringBuffer sb = new StringBuffer();
    list.forEach((item) {
      sb.write(' $item ');
    });
    return sb.toString();
  }

  String countries2String(List countries) {
    StringBuffer sb = new StringBuffer();
    countries.forEach((country) {
      sb.write('$country ');
    });
    return sb.toString();
  }
}