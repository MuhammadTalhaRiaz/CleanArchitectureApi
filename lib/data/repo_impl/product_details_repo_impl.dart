
import 'package:api_clean_structure/data/dto/product_details_dto.dart';

import '../../domain/models/product_details_model.dart';
import '../../domain/repository/product_details_repo.dart';
import '../api_service/ApiService.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepo {
  final ApiService apiService;

  ProductDetailsRepositoryImpl(this.apiService);

  @override
  Future<ProductDetailsModel> getItemDetails(String id) async {
    try {
      // Fetch the DTO using the ApiService
      final ProductDetailsDto listDto = await apiService.fetchItemDetails(id);

      // Map the DTO to Domain Model
      return ProductDetailsModel(
        id: listDto.id,
        name: listDto.name,
        data: listDto.data != null
            ? ItemData(
          color: listDto.data?.color,
          capacity: listDto.data?.capacity,
          price: listDto.data?.price,
        )
            : null,
      );
    } catch (e) {
      throw Exception('Repository failed to load item details: $e');
    }
  }
}
