import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.hintStyle,
      required this.controller,
      this.onchanged});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon, suffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.width * 0.9,
      decoration: BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.all(Radius.circular(AppConst.radius))),
      child: TextFormField(
        cursorHeight: 25,
        onChanged: onchanged,
        controller: controller,
        keyboardType: keyboardType,
        style: appstyle(18, AppConst.kbkDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConst.kbkDark,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kRed, width: .5)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent, width: .5)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kGreyDk, width: .5)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConst.kbkDark, width: .5)),
        ),
      ),
    );
  }
}
