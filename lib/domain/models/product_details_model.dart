// domain/models/list_model.dart
class ProductDetailsModel {
  final String id;
  final String name;
  final ItemData? data;

  ProductDetailsModel({required this.id, required this.name, this.data});
}

class ItemData {
  final String? color;
  final String? capacity;
  final double? price;

  ItemData({this.color, this.capacity, this.price});
}
