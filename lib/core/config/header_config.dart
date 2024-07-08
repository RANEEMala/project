import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'get_it_config.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
           "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ4Z2ZkZmdmZGZnIiwiaWF0IjoxNzIwMTg1NzM4LCJleHAiOjE3MjA3OTA1Mzh9.g3r_KrGREeiLjEuHopatULDejLViUjLPoPhc6LsBhhA"
        },
      );
    } else {
      return Options(
        headers: {
          "Content-Type": "application/json",
        },
      );
    }
  }
}



      // ${(
          //   core.get<SharedPreferences>().getString(
          //         'token',
          //       ),
          // )}