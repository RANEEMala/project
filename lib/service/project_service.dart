
import 'package:dio/dio.dart';
import 'package:project/core/config/get_it_config.dart';
import 'package:project/core/config/header_config.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/model/project_model.dart';
import 'package:project/service/core_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProjectService extends CoreService {
  Future<ResultModel> createProjectService(ProjectModel project);
}

class ProjectSeviceImp extends ProjectService {

  @override
  Future<ResultModel> createProjectService(ProjectModel project) async {
    try {
      print(baseurl + "/projects");
      print( core.get<SharedPreferences>().getString(
                  'token', ),);
      print(project.toMap());
      response = await dio.post(baseurl + "/projects", data: project.toMap(), options: HeaderConfig.getHeader(useToken: true),);
      print(response.statusCode);  
          if (response.statusCode == 200) {
             int id = response.data['id'];
             print(id);
        return SuccessModel();
      } else {
        return ErrorModel(message: "Failed to created");
      }
    } on DioException catch (e) {
      print(e);
      return ExceptionModel(message: e.message.toString());
    }
  }
}