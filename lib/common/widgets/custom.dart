import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      this.color2,
      required this.color,
      required this.text});

  final void Function()? onTap;
  final double width, height;
  final Color? color2;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color2,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: color)),
          child: Center(
              child: ReusableText(
            style: appstyle(18, color, FontWeight.bold),
            text: text,
          )),
        ));
  }
}
