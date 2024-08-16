import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/rick_morty_repository.dart';
import '../data_sources/remote/rick_morty_api_service.dart';
import '../models/rick_morty_model.dart';

class RickMortyImpl implements RickMortyRepository {
  final RickMortyApiService _rickMortyApiService;
  RickMortyImpl(this._rickMortyApiService);

  @override
  Future<DataState<List<RickMortyModel>>> getRickMorty() async {
    try {
      final httpResponse = await _rickMortyApiService.getRickMorty();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
