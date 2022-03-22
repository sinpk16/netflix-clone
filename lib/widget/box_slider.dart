import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';
import 'package:my_app/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  const BoxSlider({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('지금 뜨는 컨텐츠'),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeBoxImage(context, movies),
          ),
        )
      ]),
    );
  }
}

List<Widget> makeBoxImage(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return DetailScreen(
                movie: movies[i],
              );
            }));
      },
      child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(movies[i].poster))),
    ));
  }
  return results;
}
