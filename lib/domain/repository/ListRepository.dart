import 'package:api_clean_structure/data/Result.dart';
import 'package:api_clean_structure/domain/models/ListModel.dart';

abstract class ListRepository {
  Future<Result<List<ListModel>>> fetchList();
}