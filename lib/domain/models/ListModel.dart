import 'package:api_clean_structure/data/dto/ListDto.dart';

class ListModel {
  final String id;
  final String name;
  final ProductDataModel? data; // Nullable data

  ListModel({
    required this.id,
    required this.name,
    this.data,
  });

  // Convert ProductDto to ProductModel
  factory ListModel.fromDto(ListDto dto) {
    return ListModel(
      id: dto.id,
      name: dto.name,
      data: dto.data != null ? ProductDataModel.fromDto(dto.data!) : null,
    );
  }
}

class ProductDataModel {
  final String? color; // Nullable fields
  final String? capacity;
  final double? price;
  final String? generation;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? strapColour;
  final String? caseSize;
  final String? description;
  final double? screenSize;
  final int? year;

  ProductDataModel({
    this.color,
    this.capacity,
    this.price,
    this.generation,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.description,
    this.screenSize,
    this.year,
  });

  // Convert ProductDataDto to ProductDataModel
  factory ProductDataModel.fromDto(ProductDataDto dto) {
    return ProductDataModel(
      color: dto.color,
      capacity: dto.capacity,
      price: dto.price,
      generation: dto.generation,
      cpuModel: dto.cpuModel,
      hardDiskSize: dto.hardDiskSize,
      strapColour: dto.strapColour,
      caseSize: dto.caseSize,
      description: dto.description,
      screenSize: dto.screenSize,
      year: dto.year,
    );
  }
}
