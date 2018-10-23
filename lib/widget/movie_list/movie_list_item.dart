import 'package:flutter/material.dart';
import 'package:movie_rec_app/model/movie_item.dart';
import 'package:movie_rec_app/util/utils.dart';

class MovieListItem extends StatelessWidget {
  final MediaItem movieItem;

  // 构造函数
  const MovieListItem(this.movieItem);

  Widget _getTitleSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    movieItem.title,
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    getGenreString(movieItem.genreIds),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    movieItem.voteAverage.toString(),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    width: 4.0,
                  ),
                  Icon(
                    Icons.star,
                    size: 16.0,
                  )
                ],
              ),
              Container(
                height: 4.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    movieItem.getReleaseYear().toString(),
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Container(
                    width: 4.0,
                  ),
                  Icon(
                    Icons.date_range,
                    size: 16.0,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.jpg',
              image: movieItem.getBackDropUrl(),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
              // fadeInDuration: Duration(milliseconds: 50),
            ),
            tag: "Movie-Tag-${movieItem.id}",
          ),
          _getTitleSection(context),
        ],
      ),
    );
  }
}
