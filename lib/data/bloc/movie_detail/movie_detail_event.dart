import 'package:flutter/material.dart';

@immutable
abstract class MovieDetailAction {
  const MovieDetailAction();
}

@immutable
final class AddFavoriteAction extends MovieDetailAction {
  const AddFavoriteAction(this.id);
  final String id;
}