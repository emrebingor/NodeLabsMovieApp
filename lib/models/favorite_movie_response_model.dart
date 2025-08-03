class FavoriteMovieResponseModel {
  final List<Movies> data;

  FavoriteMovieResponseModel({required this.data});

  factory FavoriteMovieResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteMovieResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Movies.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Movies {
  final String id;
  final String? Title;
  final String? Year;
  final String? Rated;
  final String? Released;
  final String? Runtime;
  final String? Genre;
  final String? Director;
  final String? Writer;
  final String? Actors;
  final String? Plot;
  final String? Language;
  final String? Country;
  final String? Awards;
  final String? Poster;
  final String? Metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  final String? Type;
  final bool? ComingSoon;
  final bool? isFavorite;
  final List<String>? images;

  Movies({
    required this.id,
    this.Title,
    this.Year,
    this.Rated,
    this.Released,
    this.Runtime,
    this.Genre,
    this.Director,
    this.Writer,
    this.Actors,
    this.Plot,
    this.Language,
    this.Country,
    this.Awards,
    this.Poster,
    this.Metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.Type,
    this.ComingSoon,
    this.isFavorite,
    this.images,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'] ?? json['_id'] ?? '',
      Title: json['Title'],
      Year: json['Year'],
      Rated: json['Rated'],
      Released: json['Released'],
      Runtime: json['Runtime'],
      Genre: json['Genre'],
      Director: json['Director'],
      Writer: json['Writer'],
      Actors: json['Actors'],
      Plot: json['Plot'],
      Language: json['Language'],
      Country: json['Country'],
      Awards: json['Awards'],
      Poster: json['Poster'],
      Metascore: json['Metascore'],
      imdbRating: json['imdbRating'],
      imdbVotes: json['imdbVotes'],
      imdbID: json['imdbID'],
      Type: json['Type'],
      ComingSoon: json['ComingSoon'],
      isFavorite: json['isFavorite'],
      images: (json['Images'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Title': Title,
      'Year': Year,
      'Rated': Rated,
      'Released': Released,
      'Runtime': Runtime,
      'Genre': Genre,
      'Director': Director,
      'Writer': Writer,
      'Actors': Actors,
      'Plot': Plot,
      'Language': Language,
      'Country': Country,
      'Awards': Awards,
      'Poster': Poster,
      'Metascore': Metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'Type': Type,
      'ComingSoon': ComingSoon,
      'isFavorite': isFavorite,
      'Images': images,
    };
  }
}
