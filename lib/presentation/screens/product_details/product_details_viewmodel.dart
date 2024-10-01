// product_details_view_model.dart
import 'package:api_clean_structure/presentation/bloc/bloc_cubits/product_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewModel {
  final ProductDetailsCubit cubit;

  ProductDetailsViewModel(this.cubit);

  void fetchDetails(String id) {
    cubit.fetchItemDetails(id);
  }

// Add any other methods you want for UI interaction
}
