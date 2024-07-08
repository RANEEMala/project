
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/feature/auth/bloc/auth_event.dart';
import 'package:project/feature/auth/bloc/auth_state.dart';
import 'package:project/model/handling_model.dart';
import 'package:project/service/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()) {
    on<SignUp>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await AuthSeviceImp().signUp(event.user);
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
