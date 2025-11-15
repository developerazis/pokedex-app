import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokeapp/core/network/dio_client.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source.dart';
import 'package:pokeapp/data/datasources/remote/pokemon_remote_data_source_impl.dart';
import 'package:pokeapp/data/repositories/pokemon_repository_impl.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/get_evolution_chain_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_by_names_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemon_species_usecase.dart';
import 'package:pokeapp/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokeapp/presentation/bloc/evolution_bloc.dart';
import 'package:pokeapp/presentation/bloc/home_bloc.dart';
import 'package:pokeapp/presentation/bloc/species_bloc.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioClient.instance);

  // Data sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(dio: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetPokemonsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPokemonSpeciesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetEvolutionChainUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPokemonByNamesUseCase(getIt()));

  // BLoCs
  getIt.registerFactory(() => HomeBloc(getIt()));
  getIt.registerFactory(() => SpeciesBloc(getIt()));
  getIt.registerFactory(() => EvolutionBloc(getIt(), getIt()));
}
