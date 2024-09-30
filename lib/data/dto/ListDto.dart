class ListDto {
  final String id;
  final String name;
  final ProductDataDto? data; // Nullable data

  ListDto({
    required this.id,
    required this.name,
    this.data,
  });

  factory ListDto.fromJson(Map<String, dynamic> json) {
    return ListDto(
      id: json['id'] as String,
      name: json['name'] as String,
      data: json['data'] != null ? ProductDataDto.fromJson(json['data']) : null,
    );
  }
}

class ProductDataDto {
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

  ProductDataDto({
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

  factory ProductDataDto.fromJson(Map<String, dynamic> json) {
    return ProductDataDto(
      color: json['color'] as String?,
      capacity: json['capacity'] as String?,
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      generation: json['generation'] as String?,
      cpuModel: json['CPU model'] as String?,
      hardDiskSize: json['Hard disk size'] as String?,
      strapColour: json['Strap Colour'] as String?,
      caseSize: json['Case Size'] as String?,
      description: json['Description'] as String?,
      screenSize: json['Screen size'] != null ? (json['Screen size'] as num).toDouble() : null,
      year: json['year'] as int?,
    );
  }
}
