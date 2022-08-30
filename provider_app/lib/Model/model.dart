class MoviesModel {
  static String Moviesforall1 = "Moviesforall";
  static String Moviesforall2 = "Moviesforchild";
  static String Moviesforall3 = "Moviesforabove5";
  static String AllMovies = "AllMovies";
  static String AllName = "AllName";
  static String MovieKey_all = "MovieKey_all";
  static String BackImg = "BackImg";
  static String TimeTaken = "TimeTaken";

  static String TotalNoOfMovies = "TotalNoOfMovies";

  static String IDName = "ID";
  static String MovieName = "MovieName";
  static String SecondsOrNot = "SecondsOrNot";
  static String SecondsOrTimes = "SecondsOrTimes";
  static String ImageName = "ImageName";
  static String MovieKey = "MovieKey";
  static List<String>? MovieModel1ColumnName = [
    MoviesModel.IDName,
    MoviesModel.MovieName,
    MoviesModel.SecondsOrNot,
    MoviesModel.ImageName
  ];
}

class Movie {
  final int? id;
  final bool Seconds;

  final String MovieTitle;
  final int? MovieKey_all;
  final String MovieImageUrl;
  final String SecondsOrTimes;

  const Movie({
    this.id,
    required this.Seconds,
    required this.MovieTitle,
    required this.MovieKey_all,
    required this.MovieImageUrl,
    required this.SecondsOrTimes,
  });
  Movie copy(
      {int? id,
      bool? Seconds,
      String? MovieTitle,
      int? MovieKey_all,
      String? MovieImageUrl,
      String? SecondsOrTimes}) {
    return Movie(
      id: id ?? this.id,
      Seconds: Seconds ?? this.Seconds,
      MovieTitle: MovieTitle ?? this.MovieTitle,
      MovieKey_all: MovieKey_all ?? this.MovieKey_all,
      MovieImageUrl: MovieImageUrl ?? this.MovieImageUrl,
      SecondsOrTimes: SecondsOrTimes ?? this.SecondsOrTimes,
    );
  }

  static Movie fromJson(Map<String, Object?> json) {
    return Movie(
        id: json[MoviesModel.IDName] as int?,
        Seconds: json[MoviesModel.SecondsOrNot] == 1,
        MovieTitle: json[MoviesModel.ImageName] as String,
        MovieKey_all: json[MoviesModel.MovieKey_all] as int?,
        MovieImageUrl: json[MoviesModel.MovieName] as String,
        SecondsOrTimes: json[MoviesModel.SecondsOrTimes] as String);
  }

  Map<String, Object?> toJson() {
    return {
      MoviesModel.IDName: id,
      MoviesModel.SecondsOrNot: Seconds ? 1 : 0,
      MoviesModel.MovieKey_all: MovieKey_all,
      MoviesModel.MovieName: MovieTitle,
      MoviesModel.ImageName: MovieImageUrl,
      MoviesModel.SecondsOrTimes: SecondsOrTimes,
    };
  }
}

class AllMovies {
  final int? id;

  final int? MovieKey;

  final String MovieKey_all;
  final String BackImg;
  final String TimeTaken;
  final String TotalNoOfMovies;

  const AllMovies(
      {this.id,
      required this.MovieKey,
      required this.MovieKey_all,
      required this.BackImg,
      required this.TimeTaken,
      required this.TotalNoOfMovies});

  AllMovies copy(
      {int? id,
      int? MovieKey,
      String? MovieKey_all,
      String? BackImg,
      String? TimeTaken,
      String? TotalNoOfMovies}) {
    return AllMovies(
      id: id ?? this.id,
      MovieKey: MovieKey ?? this.MovieKey,
      MovieKey_all: MovieKey_all ?? this.MovieKey_all,
      BackImg: BackImg ?? this.BackImg,
      TimeTaken: TimeTaken ?? this.TimeTaken,
      TotalNoOfMovies: TotalNoOfMovies ?? this.TotalNoOfMovies,
    );
  }

  static AllMovies fromJson(Map<String, Object?> json) {
    return AllMovies(
      id: json[MoviesModel.IDName] as int?,
      MovieKey: json[MoviesModel.MovieKey] as int?,
      MovieKey_all: json[MoviesModel.MovieKey_all] as String,
      BackImg: json[MoviesModel.BackImg] as String,
      TimeTaken: json[MoviesModel.TimeTaken] as String,
      TotalNoOfMovies: json[MoviesModel.TotalNoOfMovies] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      MoviesModel.IDName: id,
      MoviesModel.MovieKey: MovieKey,
      MoviesModel.MovieKey_all: MovieKey_all,
      MoviesModel.BackImg: BackImg,
      MoviesModel.TimeTaken: TimeTaken,
      MoviesModel.TotalNoOfMovies: TotalNoOfMovies,
    };
  }
}
