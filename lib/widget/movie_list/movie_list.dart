import 'package:flutter/material.dart';
import 'package:movie_rec_app/model/movie_item.dart';
import 'package:movie_rec_app/util/utils.dart';
import 'package:movie_rec_app/widget/movie_list/movie_list_item.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key}) : super(key : key);
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<MediaItem> _movies = List(); // 初始化电影列表
  List<int> genreInt = List();
  int _pageNumber = 1; // 初始化第一页
  LoadingState _loadingState = LoadingState.LOADING; // 加载中
  bool _isLoading = false;

  // 使用懒加载策略
  _loadNextPage() {
    _isLoading = true;
    genreInt.add(28);
    genreInt.add(16);
    genreInt.add(80);
    MediaItem mediaItem1 = MediaItem(
      1, 
      'Mission: Impossible - Fallout',
      'http://www.circler.cn/poster_pic/20181018/8775384888cda0d351d5e424358896b4.jpg', 
      new DateTime.now().toString(),
      8.2, 
      genreInt);
    MediaItem mediaItem2 = MediaItem(
      2, 
      'Ant-Man and the Wasp', 
      'http://www.circler.cn/poster_pic/20180708/2895d12292411c4ceca9f6301dd1e56e.jpg', 
      new DateTime.now().toString(),
      8.5, 
      genreInt);
    MediaItem mediaItem3 = MediaItem(
      3, 
      'Avengers: Infinity War', 
      'http://www.circler.cn/poster_pic/20180409/9343b4f1073b624453c206d5a2f16dd8.jpg', 
      new DateTime.now().toString(),
      9.1,
      genreInt);
    setState(() {
      _loadingState = LoadingState.DONE;
      _movies.add(mediaItem1);
      _movies.add(mediaItem2);
      _movies.add(mediaItem3);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    
    _loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _getMovieItem(),
    );
  }

  Widget _getMovieItem() {
    switch (_loadingState) {
      case LoadingState.DONE:
        return ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            // if (!_isLoading && index > (_movies.length) * 0.6) {
            //   _loadNextPage();
            // }
            return MovieListItem(_movies[index]);
          },
        );
      case LoadingState.ERROR:
        return Text('Sorry, there was an error loading the data!');
      case LoadingState.LOADING:
        return CircularProgressIndicator();
      default:
        return Container();
    }
  }
}
