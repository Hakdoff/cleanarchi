import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecase/get_rick_morty.dart';
import 'remote_rickmorty_event.dart';
import 'remote_rickmorty_state.dart';

class RemoteRickMortyBloc
    extends Bloc<RemoteRickmortyEvent, RemoteRickmortyState> {
  final GetRickMortyUseCase _getRickMortyUseCase;

  RemoteRickMortyBloc(this._getRickMortyUseCase)
      : super(const RemoteRickMortyLoading()) {
    on<GetRickMorty>(onGetRickMorty);
  }

  // void onGetRickMorty(
  //     GetRickMorty event, Emitter<RemoteRickmortyState> emit) async {
  //   final dataState = await _getRickMortyUseCase();

  //   if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
  //     emit(RemoteRickMortyDone(dataState.data!));
  //   }

  //   if (dataState is DataFailed) {
  //     emit(RemoteRickMortyError(dataState.error!));
  //   }
  // }

  void onGetRickMorty(
      GetRickMorty event, Emitter<RemoteRickmortyState> emit) async {
    final dataState = await _getRickMortyUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print("Data fetched successfully");
      emit(RemoteRickMortyDone(dataState.data!));
    } else if (dataState is DataFailed) {
      print("Failed to fetch data: ${dataState.error}");
      emit(RemoteRickMortyError(dataState.error!));
    } else {
      print("No data available");
      emit(const RemoteRickMortyLoading());
    }
  }
}
