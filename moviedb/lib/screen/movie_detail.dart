import 'package:flutter/material.dart';
import 'package:moviedb/model/Movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenHeight = MediaQuery.of(context).size.height; //Tinggi Layar

    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}';
    } else {
      path =
          'https://images.freeimages.com/images/large-oreviews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMovie.title}'),
        ),
        body: SingleChildScrollView(
          //Fitur Scroll
          child: Center(
              //Widget Tengah
              child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16), //Padding
                height: screenHeight / 1.5, //Tinggi Gambar
                child: Image.network(path),
              ),
              Text('${selectedMovie.overview}'),
              Text(''),
              Text('Created by Alfian Dwiki, NIM: 19201199'),
            ],
          )),
        ));
  }
}
