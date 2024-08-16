import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/rick_morty_model.dart';

part 'rick_morty_api_service.g.dart';

@RestApi(baseUrl: rickmortyApiBaseUrl)
abstract class RickMortyApiService {
  factory RickMortyApiService(Dio dio) = _RickMortyApiService;

  @GET('/characters')
  Future<HttpResponse<List<RickMortyModel>>> getRickMorty({
    @Query("name") String? name,
    @Query("status") String? status,
    @Query("species") String? species,
    @Query("type") String? type,
    @Query("gender") String? gender,
    @Query("image") String? image,
  });
}
