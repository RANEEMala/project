

import 'package:dio/dio.dart';
import 'package:project/core/config/header_config.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/model/task_model.dart';
import 'package:project/service/core_service.dart';

abstract class TaskSerivce extends CoreService {
    Future<ResultModel> createTasks(List <TaskModel> task);

}


class TaskSerivceImp extends TaskSerivce {
  @override
  Future<ResultModel> createTasks(List <TaskModel> task) async {

    try {
      response = await dio.post(baseurl + "/tasks", data: task, options: HeaderConfig.getHeader(useToken: true),
);
     if (response.statusCode == 200) {
        return SuccessModel();
      } else {
        return ErrorModel(message: "Failed to created");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message.toString());
    }
  }
}