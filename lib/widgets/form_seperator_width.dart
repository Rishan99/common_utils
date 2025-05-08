import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Spacing Between Form Fields
class FormSeperatorWidth extends StatelessWidget {
  final double width;
  const FormSeperatorWidth({
    super.key,
    this.width = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.h,
    );
  }
}
