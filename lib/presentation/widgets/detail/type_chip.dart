import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/core/utils/string_extension.dart';

class TypeChip extends StatelessWidget {
  final String type;
  final Orientation orientation;

  const TypeChip({super.key, required this.type, this.orientation = Orientation.portrait,});

  @override
  Widget build(BuildContext context) {
    double typeFontSize = orientation == Orientation.portrait ? 12.sp : 6.sp;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: setTypeColor(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type.titleCase(),
        style: TextStyle(color: Colors.white, fontSize: typeFontSize, fontWeight: FontWeight.w400),
      ),
    );
  }
}
