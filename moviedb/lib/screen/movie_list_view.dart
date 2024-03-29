import 'package:flutter/material.dart';
import 'package:moviedb/screen/movie_detail.dart';
import '../komponen/http_helper.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  //Tambah Variabel Search
  Icon searchIcon = Icon(Icons.search);
  Widget titleBar = Text('Daftar Film');
  late int moviesCount;
  late List movies;
  late HttpHelper helper;
  //Tambah Icon
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clap';

  @override
  void initState() {
    defaultList();
    super.initState();
  }

  void toggleSearch() {
    setState(() {
      if (this.searchIcon.icon == Icons.search) {
        this.searchIcon = Icon(Icons.cancel);
        this.titleBar = TextField(
          autofocus: true,
          onSubmitted: (text) {
            searchMovies(text);
          },
          decoration: InputDecoration(hintText: 'Ketik Data Pencarian'),
          textInputAction: TextInputAction.search,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        );
      } else {
        setState(() {
          this.searchIcon = Icon(Icons.search);
          this.titleBar = Text('Daftar Film');
        });
        defaultList();
      }
    });
  }

  Future searchMovies(String text) async {
    List searchedMovies = await helper.findMovies(text);
    setState(() {
      movies = searchedMovies;
      moviesCount = movies.length;
    });
  }

  Future defaultList() async {
    moviesCount = 0;
    movies = [];
    helper = HttpHelper();
    List moviesFromAPI = [];
    moviesFromAPI = await helper.getUpComingAsList();
    setState(() {
      movies = moviesFromAPI;
      moviesCount = movies.length;
    });
  }

  Future topRatedList() async {
    moviesCount = 0;
    movies = [];
    helper = HttpHelper();
    List moviesFromAPI = [];
    moviesFromAPI = await helper.getTopRatedAsList();
    setState(() {
      movies = moviesFromAPI;
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image; //Tambah Image
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: Text('Top Rated'),
            onTap: () {
              Navigator.pop(context); //Close Drawer
              setState(() {
                this.searchIcon = Icon(Icons.search);
                this.titleBar = Text('Daftar Film Rating Tertinggi');
              });
              topRatedList(); // Perintah getUpcoming()
            },
          ),
          ListTile(
            title: Text('Upcoming'),
            onTap: () {
              Navigator.pop(context); //Close Drawer
              setState(() {
                this.searchIcon = Icon(Icons.search);
                this.titleBar = Text('Daftar Film');
              });
              defaultList(); // Perintah getUpcoming()
            },
          ),
          ListTile(
            title: Text('Cari'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                this.searchIcon = Icon(Icons.cancel);
                this.titleBar = TextField(
                  autofocus: true,
                  onSubmitted: (text) {
                    searchMovies(text);
                  },
                  decoration: InputDecoration(hintText: 'Ketik kata Pencarian'),
                  textInputAction: TextInputAction.search,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                );
              });
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: titleBar,
        actions: [
          IconButton(
            icon: searchIcon,
            onPressed: toggleSearch,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, position) {
          //Kode Akses Image
          if (movies[position].posterPath != null) {
            image = NetworkImage(iconBase + movies[position].posterPath);
          } else {
            image = NetworkImage(defaultImage);
          }
          //======================
          return Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) {
                    return MovieDetail(
                      selectedMovie: movies[position],
                    );
                  },
                );
                Navigator.push(context, route);
              },
              leading: CircleAvatar(
                backgroundImage: image,
              ), //Kolom Depan Title
              title: Text(movies[position].title),
              subtitle: Text('Released: ' +
                  movies[position].releaseDate +
                  ' - Rate: ' +
                  movies[position].voteAverage.toString()),
            ),
          );
        },
      ),
    );
  }
}
