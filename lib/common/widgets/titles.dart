import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/height_spacer.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:advanced_todo_list/common/widgets/width_spacer.dart';
import 'package:advanced_todo_list/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTiles extends StatelessWidget {
  const BottomTiles(
      {super.key, required this.text, required this.text2, this.clr});

  final String text, text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.width,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              var color = ref.read(todoStateProvider.notifier).getRandomColor();
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.radius)),
                    color: color),
              );
            }),
            const WidthSpacer(width: 15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: text,
                      style: appstyle(24, AppConst.kLight, FontWeight.bold)),
                  const HeightSpacer(height: 10),
                  ReusableText(
                      text: text2,
                      style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
