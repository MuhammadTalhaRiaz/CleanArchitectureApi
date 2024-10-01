

import 'package:api_clean_structure/domain/models/product_details_model.dart';
import 'package:api_clean_structure/domain/repository/product_details_repo.dart';

class ProductDetailsUsecase {
  final ProductDetailsRepo repository;

  ProductDetailsUsecase(this.repository);

  Future<ProductDetailsModel> execute(String id) async {
    try {
      return await repository.getItemDetails(id);
    } catch (error) {
      throw Exception('Error fetching product details: $error');
    }
  }
}