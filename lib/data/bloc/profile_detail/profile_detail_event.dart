import 'package:flutter/material.dart';

@immutable
abstract class ProfileDetailAction {
  const ProfileDetailAction();
}

@immutable
final class UpdatePhotoAction extends ProfileDetailAction {
  const UpdatePhotoAction();
}