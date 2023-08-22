import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/height_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
                text: 'Todo',
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
            ReusableText(
                text: 'Todo',
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
            ReusableText(
                text: 'Todo',
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key,
    required int width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
    );
  }
}
