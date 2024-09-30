import 'package:api_clean_structure/domain/repository/ListRepository.dart';
import 'package:api_clean_structure/presentation/bloc/bloc_cubits/ListCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/ListStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocProvider(
        create: (context) => ListCubit(RepositoryProvider.of<ListRepository>(context))..fetchProducts(),
        child: BlocBuilder<ListCubit, ListState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('ID: ${product.id}'),
                    // You can display more details here based on the ProductModel
                    onTap: () {
                      // Handle product tap, e.g., navigate to product details
                    },
                  );
                },
              );
            } else if (state is ListError) {
              return Center(child: Text('Failed to fetch products: ${state.message}'));
            }
            return Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
