import 'package:advanced_todo_list/common/widgets/titles.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class xpansionTile extends StatelessWidget {
  const xpansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children});

  final String text, text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppConst.kbkLight,
          borderRadius: BorderRadius.all(Radius.circular(AppConst.radius))),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: BottomTiles(
              text: text,
              text2: text2,
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            controlAffinity: ListTileControlAffinity.trailing,
            trailing: trailing,
            children: children,
          )),
    );
  }
}
