import 'user.dart';
import 'movie_rate.dart';
class VideoItem{
  String id;
  String cover_img;
  String title;
  String url;
  User creator;
  int hot;
  MovieRate rating;
  VideoItem({
    this.id,
    this.title,
    this.cover_img,
    this.url,
    this.hot,
    this.rating,
    this.creator
  });

  VideoItem.fromJson(Map data) {
    id = data['_id'];
    rating = data['rating'];
    cover_img = data['cover_img'];
    title = data['title'];
    url = data['url'];
    creator =  User.fromJson(data['creator']);
    hot = data['hot'];
    id = data['id'];
    title = data['title'];
  }

}