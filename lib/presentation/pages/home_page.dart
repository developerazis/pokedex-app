import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/core/di/injection.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/bloc/home_bloc.dart';
import 'package:pokeapp/presentation/bloc/home_event.dart';
import 'package:pokeapp/presentation/bloc/home_state.dart';
import 'package:pokeapp/presentation/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(FetchPokemons()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context.read<HomeBloc>().add(FetchPokemons());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        centerTitle: true,
        elevation: 8,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,

      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state.pokemons.isEmpty && (state is HomeLoading || state is HomeInitial)) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.pokemons.isEmpty && state is HomeError) {
            return Center(child: Text(state.message));
          }

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  controller: _scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    return PokemonCard(pokemon: state.pokemons[index]);
                  },
                ),
              ),
              if (state is HomeLoading && state.pokemons.isNotEmpty)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
