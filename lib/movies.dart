import 'package:hive/hive.dart';
part 'movies.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String director;
  @HiveField(2)
  String posterLink;

  Movie(this.name, this.director, this.posterLink);

  String get _name {
    return name;
  }

  String get _director {
    return director;
  }

  String get _posterLink {
    return posterLink;
  }
}
