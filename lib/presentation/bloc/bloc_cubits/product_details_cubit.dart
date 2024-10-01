import 'package:api_clean_structure/domain/usecase/ProductDetailsUsecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsUsecase getItemDetailsUseCase;

  ProductDetailsCubit(this.getItemDetailsUseCase) : super(ItemDetailsInitial());

  Future<void> fetchItemDetails(String id) async {
    try {
      emit(ItemDetailsLoading());
      final item = await getItemDetailsUseCase.execute(id);
      emit(ItemDetailsLoaded(item));
    } catch (e) {
      emit(ItemDetailsError(e.toString()));
    }
  }
}
