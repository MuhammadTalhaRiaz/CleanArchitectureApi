import '../models/product_details_model.dart';

abstract class ProductDetailsRepo{
  Future<ProductDetailsModel> getItemDetails(String id);
}