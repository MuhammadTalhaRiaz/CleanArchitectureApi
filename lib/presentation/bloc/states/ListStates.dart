// product_state.dart
import 'package:api_clean_structure/domain/models/ListModel.dart';

abstract class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final List<ListModel> products;

  ListLoaded(this.products);
}

class ListError extends ListState {
  final String message;

  ListError(this.message);
}
