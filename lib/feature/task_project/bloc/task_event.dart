
import 'package:flutter/material.dart';

@immutable
sealed class taskEvent {}


class createTasks extends taskEvent {
  List <String> tasks;
  createTasks({
    required this.tasks,
  });
}
