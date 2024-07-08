// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project/model/project_model.dart';

@immutable
sealed class ProjectEvent {}

class createProject extends ProjectEvent {
 final ProjectModel project;
  createProject({
    required this.project,
  });
 
}
