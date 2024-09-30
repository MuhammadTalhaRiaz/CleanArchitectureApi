
import 'package:api_clean_structure/data/Result.dart';
import 'package:api_clean_structure/data/api_service/ApiService.dart';
import 'package:api_clean_structure/data/dto/ListDto.dart';
import 'package:api_clean_structure/domain/models/ListModel.dart';
import 'package:api_clean_structure/domain/repository/ListRepository.dart';

class ListRepositoryImpl implements ListRepository {
  final ApiService apiService;

  ListRepositoryImpl(this.apiService);

  @override
  Future<Result<List<ListModel>>> fetchList() async {
    try {
      // Fetch the list of product DTOs from the API service
      final List<ListDto> productDtos = await apiService.getList();

      // Convert DTOs to domain models
      final List<ListModel> products = productDtos.map((dto) => ListModel.fromDto(dto)).toList();

      return Result.success(products);
    } catch (e) {
      return Result.failure('Failed to fetch products: ${e.toString()}');
    }
  }
}
