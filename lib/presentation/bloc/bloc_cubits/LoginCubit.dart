

import 'package:api_clean_structure/data/requests/LoginRequestData.dart';
import 'package:api_clean_structure/domain/usecase/LoginUseCase.dart';
import 'package:api_clean_structure/presentation/bloc/states/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await loginUseCase.execute(LoginRequestData(email: email, password: password));

    if (result.isSuccess) {
      emit(LoginSuccess(result.data!));
    } else {
      emit(LoginFailure(result.errorMessage ?? 'An unknown error occurred'));
    }
  }
}
