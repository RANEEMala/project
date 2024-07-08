// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

@immutable
sealed class ProjectState {}

class LoadingState extends ProjectState {}

class InitialState extends ProjectState {}

class SuccessState extends ProjectState {}

class ErrorState extends ProjectState {
  String message;
  ErrorState({
    required this.message,
  });
}
class ExceptionState extends ProjectState {
  String wrong;
  ExceptionState({
    required this.wrong,
  });
}
