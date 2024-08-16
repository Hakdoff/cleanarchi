import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/rick_morty_entity.dart';
import '../repository/rick_morty_repository.dart';

class GetRickMortyUseCase
    implements UseCase<DataState<List<RickMortyEntity>>, void> {
  final RickMortyRepository _rickMortyReposity;

  GetRickMortyUseCase(this._rickMortyReposity);

  @override
  Future<DataState<List<RickMortyEntity>>> call({void params}) {
    return _rickMortyReposity.getRickMorty();
  }
}
