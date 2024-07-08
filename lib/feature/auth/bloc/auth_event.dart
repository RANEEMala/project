
import 'package:flutter/material.dart';
import 'package:project/model/signup_model.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent {
 final SignupModel user;
  SignUp({
    required this.user,
  });
}
