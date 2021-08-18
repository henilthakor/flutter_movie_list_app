import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_list_flutter/movies.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Movie>('mymovies').listenable(),
        builder: (BuildContext context, box, _) {
          var ML = box.toMap();
          var list = [];
          ML.forEach((k, v) => list.add({'key': k, 'value': v}));
          print(list);
          return Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Card(
                        elevation: 8.0,
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                child: Image.network(
                                  list[index]['value'].posterLink,
                                  loadingBuilder:
                                      (context, child, loadingProgress) =>
                                          (loadingProgress == null)
                                              ? child
                                              : CircularProgressIndicator(),
                                  errorBuilder: (context, error, stackTrace) =>
                                      Text('Loading Image..'),
                                  height: 300.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index]['value'].name,
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          list[index]['value'].director,
                                          style: TextStyle(
                                              //fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepPurple),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () => Navigator.pushNamed(
                                        context, 'edit',
                                        arguments: list[index]['key']),
                                    color: Colors.deepPurple,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      box.delete(list[index]['key']);
                                    },
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                }),
          );
        });
  }
}
