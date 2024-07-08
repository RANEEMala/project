// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

@immutable
sealed class AuthState {}

class LoadingState extends AuthState {}

class InitialState extends AuthState {}

class SuccessState extends AuthState {}

class ErrorState extends AuthState {
  String message;
  ErrorState({
    required this.message,
  });
}
class ExceptionState extends AuthState {
  String wrong;
  ExceptionState({
    required this.wrong,
  });
}
