
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/config/bloc_observe_config.dart';
import 'package:project/core/config/get_it_config.dart';
import 'package:project/core/resources/color_palete.dart';
import 'package:project/feature/auth/view/signUp_page.dart';
import 'package:project/feature/create_project/view/project_page.dart';
import 'package:project/feature/task_project/view/task_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await  setup();
  Bloc.observer = MyBlocObserver();
  print(core.get<SharedPreferences>().getString('token'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: (core.get<SharedPreferences>().getString('token') == null)
           ? signUpPage()
           :  HomePage()
          // TaskPage()
            );
  }
}

