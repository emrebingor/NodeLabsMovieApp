import 'package:flutter/material.dart';

@immutable
abstract class ProfileAction {
  const ProfileAction();
}

@immutable
final class ProfileInitAction extends ProfileAction {
  const ProfileInitAction();
}