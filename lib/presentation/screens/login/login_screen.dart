import 'package:api_clean_structure/presentation/bloc/bloc_cubits/LoginCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/login_states.dart';
import 'package:api_clean_structure/presentation/screens/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Replace with the actual path

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          // Handle navigation on success state
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListScreen()),
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            // Handle loading state
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }

            // Handle failure state
            if (state is LoginFailure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }

            // Default state (initial state)
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      context.read<LoginCubit>().login(email, password);
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
