import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeapp/core/utils/elemen_color_mapper.dart';
import 'package:pokeapp/core/utils/string_extension.dart';

class TypeChip extends StatelessWidget {
  final String type;

  const TypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: setTypeColor(type),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        type.titleCase(),
        style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
