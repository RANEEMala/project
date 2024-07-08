import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/feature/create_project/bloc/project_event.dart';
import 'package:project/feature/create_project/bloc/project_state.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/service/project_service.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(InitialState()) {
    on<createProject>((event, emit) async {
      emit(LoadingState());
      print("iam in bloc");
      ResultModel res = await ProjectSeviceImp().createProjectService(event.project);
      if (res is SuccessModel) {
        emit(SuccessState());
      } else if (res is ErrorModel) {
        emit(ErrorState(message: res.toString()));
      } else {
        emit(ExceptionState(wrong: res.toString()));
      }
    });
  }
}