import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/rick_morty_entity.dart';

abstract class RemoteRickmortyState extends Equatable {
  final List<RickMortyEntity>? rickmorty;
  final DioError? error;

  const RemoteRickmortyState({this.error, this.rickmorty});

  @override
  List<Object> get props => [rickmorty!, error!];
}

class RemoteRickMortyLoading extends RemoteRickmortyState {
  const RemoteRickMortyLoading();
}

class RemoteRickMortyDone extends RemoteRickmortyState {
  const RemoteRickMortyDone(List<RickMortyEntity> rickmorty)
      : super(rickmorty: rickmorty);
}

class RemoteRickMortyError extends RemoteRickmortyState {
  const RemoteRickMortyError(DioError error) : super(error: error);
}
