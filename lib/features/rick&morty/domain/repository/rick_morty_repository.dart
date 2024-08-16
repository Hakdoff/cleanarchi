import '../../../../core/resources/data_state.dart';
import '../entity/rick_morty_entity.dart';

abstract class RickMortyRepository {
  Future<DataState<List<RickMortyEntity>>> getRickMorty();
}
