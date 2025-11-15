import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/domain/entities/pokemon_entity.dart';
import 'package:pokeapp/presentation/widgets/detail/info_row.dart';

class BaseStatsSection extends StatelessWidget {
  final PokemonEntity pokemon;

  const BaseStatsSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          _StatBar(label: 'HP', value: pokemon.hp),
          _StatBar(label: 'Attack', value: pokemon.attack),
          _StatBar(label: 'Defense', value: pokemon.defense),
          _StatBar(label: 'Sp. Atk', value: pokemon.specialAttack),
          _StatBar(label: 'Sp. Def', value: pokemon.specialDefense),
          _StatBar(label: 'Speed', value: pokemon.speed),
        ],
      ),
    );
  }
}

class _StatBar extends StatefulWidget {
  final String label;
  final int value;

  const _StatBar({required this.label, required this.value});

  _StatBarState build(BuildContext context) {
    return _StatBarState();
  }

  @override
  State<StatefulWidget> createState() {
    return _StatBarState();
  }
}

class _StatBarState extends State<_StatBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.value.toDouble())
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(widget.label, style: TextStyle(color: Colors.grey[600])),
          ),
          SizedBox(
            width: 40,
            child: Text(
              widget.value.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: _animation.value / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                      widget.value > 50 ? Colors.green : Colors.red),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
