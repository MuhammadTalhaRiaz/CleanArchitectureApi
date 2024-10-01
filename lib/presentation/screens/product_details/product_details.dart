import 'package:api_clean_structure/domain/usecase/ProductDetailsUsecase.dart';
import 'package:api_clean_structure/presentation/bloc/bloc_cubits/product_details_cubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/product_details_states.dart';
import 'package:api_clean_structure/presentation/screens/product_details/product_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetailsScreen extends StatelessWidget {
  final String productId; // Pass this as an argument when navigating

  const ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the Cubit from the context
    final cubit = context.read<ProductDetailsCubit>();
    final viewModel = ProductDetailsViewModel(cubit);

    // Fetching item details on the screen load
    viewModel.fetchDetails(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ItemDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ItemDetailsLoaded) {
            final item = state.item;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Color: ${item.data?.color ?? 'N/A'}'),
                  Text('Capacity: ${item.data?.capacity ?? 'N/A'}'),
                  // Add more fields as necessary
                ],
              ),
            );
          } else if (state is ItemDetailsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
