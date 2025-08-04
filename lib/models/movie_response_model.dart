final class MovieResponseModel {
  MovieResponseModel({
    this.data,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) => MovieResponseModel(
    data: json['data'] is Map<String, dynamic> ? Data.fromJson(json['data'] as Map<String, dynamic>) : null,
  );

  Data? data;

  Map<String, dynamic> toJson() => {
    'data': data,
  };
}

final class Data {
  Data({
    this.movies,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    movies: (json['movies'] as List<dynamic>?)?.map((e) => Movies.fromJson(e as Map<String, dynamic>)).toList(),
    pagination: json['pagination'] is Map<String, dynamic> ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>) : null,
  );

  List<Movies>? movies;
  Pagination? pagination;

  Map<String, dynamic> toJson() => {
    'movies': movies,
    'pagination': pagination,
  };
}

final class Movies {
  Movies({
    this.id,
    this.Title,
    this.Year,
    this.Poster,
    this.Director,
    this.Genre,
    this.imdbRating,
    this.Actors,
    this.Plot,
    this.images,
    this.isFavorite,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    id: json['id'] is String ? json['id'] as String : null,
    isFavorite: json['isFavorite'] is bool ? json['isFavorite'] as bool : null,
    Poster: json['Poster'] is String ? json['Poster'] as String : null,
    Title: json['Title'] is String ? json['Title'] as String : null,
    Year: json['Year'] is String ? json['Year'] as String : null,
    Director: json['Director'] is String ? json['Director'] as String : null,
    Genre: json['Genre'] is String ? json['Genre'] as String : null,
    imdbRating: json['imdbRating'] is String ? json['imdbRating'] as String : null,
    Actors: json['Actors'] is String ? json['Actors'] as String : null,
    Plot: json['Plot'] is String ? json['Plot'] as String : null,
    images: (json['Images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
  );

  String? id;
  bool? isFavorite;
  String? Poster;
  String? Title;
  String? Year;
  String? Director;
  String? Genre;
  String? imdbRating;
  String? Actors;
  String? Plot;
  List<String>? images;

  Map<String, dynamic> toJson() => {
    'id': id,
    'Poster': Poster,
    'isFavorite': isFavorite,
    'Title': Title,
    'Year': Year,
    'Director': Director,
    'Genre': Genre,
    'imdbRating': imdbRating,
    'Actors': Actors,
    'Plot': Plot,
    'images': images,
  };
}

final class Pagination {
  Pagination({
    this.totalCount,
    this.perPage,
    this.maxPage,
    this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json['totalCount'] is int ? json['totalCount'] as int : null,
    perPage: json['perPage'] is int ? json['perPage'] as int : null,
    maxPage: json['maxPage'] is int ? json['maxPage'] as int : null,
    currentPage: json['currentPage'] is int ? json['currentPage'] as int : null,
  );

  int? totalCount;
  int? perPage;
  int? maxPage;
  int? currentPage;

  Map<String, dynamic> toJson() => {
    'totalCount': totalCount,
    'perPage': perPage,
    'maxPage': maxPage,
    'currentPage': currentPage,
  };
}