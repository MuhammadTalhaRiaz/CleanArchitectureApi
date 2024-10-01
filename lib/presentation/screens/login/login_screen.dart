import 'package:api_clean_structure/presentation/bloc/bloc_cubits/LoginCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/login_states.dart';
import 'package:api_clean_structure/presentation/screens/list_api/ListScreen.dart';
import 'package:api_clean_structure/presentation/screens/login/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
// Replace with the actual path

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          // Handle navigation on success state
          if (state is LoginSuccess) {
            // Navigate to the next screen after successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );
          } else if (state is LoginFailure) {
            // Show an error message in case of failure
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed: ${state.errorMessage}')),
            );
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            // Handle loading state
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Default state (initial or after failure)
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final email ="eve.holt@reqres.in";
                      final password = "cityslicka";

                      // Trigger login action via the cubit
                      context.read<LoginCubit>().login(email, password);
                    },
                    child: const Text('Login'),
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

