import 'package:api_clean_structure/domain/repository/ListRepository.dart';
import 'package:api_clean_structure/presentation/bloc/bloc_cubits/ListCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/ListStates.dart';
import 'package:api_clean_structure/presentation/screens/list_api/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final ProductListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final listCubit = context.read<ListCubit>(); // Get the ListCubit instance
    _viewModel = ProductListViewModel(listCubit);
    _viewModel.fetchProducts(); // Fetch products when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (context, state) {
          if (state is ListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ListError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is ListLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];

                // Use null-aware access for data
                final productPrice = product.data?.price ?? 'No price available'; // Default value if price is null

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(productPrice.toString()),
                );
              },
            );
          }

          return Container(); // Default case
        },
      ),
    );
  }
}


