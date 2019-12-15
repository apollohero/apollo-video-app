import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_recommend/model/video_item.dart';

import 'package:movie_recommend/public.dart';

class VideoListItem extends StatelessWidget {
  final VideoItem video;
  final String actionStr;

  const VideoListItem(this.video, this.actionStr);

  Widget _getActionWidget(BuildContext context) {
    Widget action;

    switch (actionStr) {
      case 'coming_soon':
        action = Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.circular(2.0)),
        );
        break;
      default:
        action = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              color: Color(0xFFF7AC3A),
              onPressed: () {},
            ),
            Text('收藏', style: TextStyle(color: Color(0xFFF7AC3A)))
          ],
        );
        break;
    }
    return action;
  }

  @override
  Widget build(BuildContext context) {
    double imgWidth = 100;
    double height = imgWidth / 0.7;
    double spaceWidth = 15;
    double actionWidth = 60;
    Widget action = _getActionWidget(context);

    return GestureDetector(
      onTap: () {
        AppNavigator.pushVideoDetail(context,video);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(spaceWidth, spaceWidth, 0, spaceWidth),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.lightGrey, width: 0.5)),
            color: AppColor.white),
        child: Row(
          children: <Widget>[
            MovieCoverImage(
              video.cover_img,
              width: imgWidth,
              height: height,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(spaceWidth, 0, spaceWidth, 0),
              height: height,
              width: Screen.width - imgWidth - spaceWidth * 2 - actionWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    video.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new StaticRatingBar(
                        size: 13.0,
                        rate: video.rating.average/2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        video.rating.toString(),
                        style: TextStyle(color: AppColor.grey, fontSize: 12.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: actionWidth,
              height: height,
              child: Center(child: action),
            ),
          ],
        ),
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

  String genres2String(List genres) {
    StringBuffer sb = new StringBuffer();
    genres.forEach((genre) {
      sb.write(' $genre ');
    });
    return sb.toString();
  }
}
