import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightSpacer extends StatelessWidget {
  final double size;
  const HightSpacer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
    );
  }
}