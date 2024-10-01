import 'package:api_clean_structure/presentation/bloc/bloc_cubits/LoginCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/login_states.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginCubit loginCubit;

  String? email;
  String? password;

  // To expose current state to the UI
  LoginState get state => loginCubit.state;

  LoginViewModel(this.loginCubit);

  // To initiate login process
  void login(String email, String password) {
    this.email = email;
    this.password = password;
    loginCubit.login(email, password);
    notifyListeners();  // Notify UI on any changes
  }

  // Listen to Cubit state changes
  void listenToLoginCubit(BuildContext context) {
    loginCubit.stream.listen((state) {
      notifyListeners();  // Notify UI when state changes
    });
  }
}
