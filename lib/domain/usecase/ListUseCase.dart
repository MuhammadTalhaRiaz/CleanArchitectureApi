import 'package:api_clean_structure/domain/models/ListModel.dart';
import 'package:api_clean_structure/domain/repository/ListRepository.dart';

import '../../data/Result.dart';

class ListUsecase {
  final ListRepository listRepository;

  ListUsecase(this.listRepository);

  Future<Result<List<ListModel>>> execute() {
    return listRepository.fetchList();
  }
}