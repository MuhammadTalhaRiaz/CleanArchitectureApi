
import 'package:api_clean_structure/domain/models/product_details_model.dart';

abstract class ProductDetailsState {}

class ItemDetailsInitial extends ProductDetailsState {}

class ItemDetailsLoading extends ProductDetailsState {}

class ItemDetailsLoaded extends ProductDetailsState {
  final ProductDetailsModel item;

  ItemDetailsLoaded(this.item);
}

class ItemDetailsError extends ProductDetailsState {
  final String message;

  ItemDetailsError(this.message);
}