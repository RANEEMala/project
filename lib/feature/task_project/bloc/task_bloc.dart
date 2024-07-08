
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/feature/task_project/bloc/task_event.dart';
import 'package:project/feature/task_project/bloc/task_state.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/model/task_model.dart';
import 'package:project/service/task_service.dart';

class taskBloc extends Bloc<taskEvent, taskState> {
  taskBloc() : super(InitialState()) {
    on<createTasks>((event, emit) async {
      emit(LoadingState());
        List <TaskModel> task= [];
        for (var element in event.tasks){
        TaskModel e = TaskModel(
        taskDescription: element,
         taskStatus: "NEW",
          project_id: 1);
        print(e);
         task.add(e);
        }
        ResultModel result = await TaskSerivceImp().createTasks(task);
        if (result is SuccessModel) {
        emit(SuccessState());
      } else if (result is ErrorModel) {
        emit(ErrorState(message: result.toString()));
      } else {
        emit(ExceptionState(wrong: result.toString()));
      }
    });
  }
}

