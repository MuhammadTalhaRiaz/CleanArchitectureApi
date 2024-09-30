import 'package:api_clean_structure/domain/repository/ListRepository.dart';
import 'package:api_clean_structure/presentation/bloc/states/ListStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  final ListRepository listRepository;

  ListCubit(this.listRepository) : super(ListInitial());

  Future<void> fetchProducts() async {
    emit(ListLoading());
    try {
      final result = await listRepository.fetchList();
      if (result.isSuccess) {
        emit(ListLoaded(result.data!));
      } else {
        emit(ListError(result.errorMessage!));
      }
    } catch (e) {
      emit(ListError(e.toString()));
    }
  }
}
