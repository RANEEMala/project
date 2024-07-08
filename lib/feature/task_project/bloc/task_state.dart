// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

@immutable
sealed class taskState {}

class LoadingState extends taskState {}

class InitialState extends taskState {}

class SuccessState extends taskState {}

class ErrorState extends taskState {
  String message;
  ErrorState({
    required this.message,
  });
}
class ExceptionState extends taskState {
  String wrong;
  ExceptionState({
    required this.wrong,
  });
}
