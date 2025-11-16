import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isPortrait = orientation == Orientation.portrait;
      return Padding(
        padding: EdgeInsets.symmetric(vertical: isPortrait ? 8.h : 4.h),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: isPortrait ? 14.sp : 10.sp),
              ),
            ),
            Expanded(
                child: Text(
              value,
              style: TextStyle(fontSize: isPortrait ? 14.sp : 10.sp),
            )),
          ],
        ),
      );
    });
  }
}
