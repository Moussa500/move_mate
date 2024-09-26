import 'package:flutter/material.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';

class CustomOutlinedbutton extends StatelessWidget {
   final void Function()? onPressed;
   final String label;
   final double? height;
   final double? width;
  const CustomOutlinedbutton({super.key, required this.onPressed,required this.label,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height?? 60),),
      child:  Text(label,style: const Appstyle(fontWeight: FontWeight.w600, fontSize: 18, textColor: Colors.white),),
    );
  }
}