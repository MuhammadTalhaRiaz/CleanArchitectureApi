import 'package:api_clean_structure/data/api_service/ApiService.dart';
import 'package:api_clean_structure/data/repo_impl/ListRepoImpl.dart';
import 'package:api_clean_structure/data/repo_impl/LoginRepositoryImpl.dart';
import 'package:api_clean_structure/data/repo_impl/product_details_repo_impl.dart';
import 'package:api_clean_structure/domain/repository/ListRepository.dart';
import 'package:api_clean_structure/domain/repository/LoginRepository.dart';
import 'package:api_clean_structure/domain/repository/product_details_repo.dart';
import 'package:api_clean_structure/domain/usecase/ListUseCase.dart';
import 'package:api_clean_structure/domain/usecase/LoginUseCase.dart';
import 'package:api_clean_structure/domain/usecase/ProductDetailsUsecase.dart';
import 'package:api_clean_structure/presentation/bloc/bloc_cubits/LoginCubit.dart';
import 'package:api_clean_structure/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'presentation/bloc/bloc_cubits/ListCubit.dart';
import 'presentation/bloc/bloc_cubits/product_details_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),

        //Login
        Provider<LoginRepository>(
          create: (context) => LoginRepositoryImpl(context.read<ApiService>()),
        ),
        Provider(
            create: (context) => LoginUseCase(context.read<LoginRepository>())),
        BlocProvider(
            create: (context) => LoginCubit(context.read<LoginUseCase>())),

        //List
        Provider<ListRepository>(
          create: (context) => ListRepositoryImpl(context.read<ApiService>()),
        ),
        Provider(
            create: (context) => ListUsecase(context.read<ListRepository>())),
        BlocProvider(
            create: (context) => ListCubit(context
                .read<ListRepository>())),


        Provider<ProductDetailsRepo>(
          create: (context) => ProductDetailsRepositoryImpl(context.read<ApiService>()),
        ),
        Provider(
            create: (context) => ProductDetailsUsecase(context.read<ProductDetailsRepo>())),
        BlocProvider<ProductDetailsCubit>(
          create: (context) => ProductDetailsCubit(context.read<ProductDetailsUsecase>()), // Pass Usecase here
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginScreen(),
      ),
    );
  }
}
