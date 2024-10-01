// data/models/list_dto.dart
class ProductDetailsDto {
  final String id;
  final String name;
  final ItemDataDto? data;

  ProductDetailsDto({required this.id, required this.name, this.data});

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) {
    return ProductDetailsDto(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null ? ItemDataDto.fromJson(json['data']) : null,
    );
  }
}

class ItemDataDto {
  final String? color;
  final String? capacity;
  final double? price;

  ItemDataDto({this.color, this.capacity, this.price});

  factory ItemDataDto.fromJson(Map<String, dynamic> json) {
    return ItemDataDto(
      color: json['color'],
      capacity: json['capacity'],
      price: json['price']?.toDouble(), // Convert to double if necessary
    );
  }
}
