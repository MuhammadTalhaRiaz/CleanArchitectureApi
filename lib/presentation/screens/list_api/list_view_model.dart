import 'package:api_clean_structure/presentation/bloc/bloc_cubits/ListCubit.dart';
import 'package:api_clean_structure/presentation/bloc/states/ListStates.dart';


class ProductListViewModel {
  final ListCubit listCubit;

  ProductListViewModel(this.listCubit);

  void fetchProducts() {
    listCubit.fetchProducts();
  }

  ListState get state => listCubit.state;
}
