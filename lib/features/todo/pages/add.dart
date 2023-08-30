import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/custom.dart';
import 'package:advanced_todo_list/common/widgets/custom_text_field.dart';
import 'package:advanced_todo_list/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 10),
            CustomTextField(
              hintText: 'Add Title',
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.bold),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: 'Add description',
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.bold),
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
              onTap: () {},
              width: AppConst.width,
              height: 52,
              color: AppConst.kLight,
              text: 'Set Date',
              color2: AppConst.kBlueLight,
            ),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineButton(
                    onTap: () {},
                    width: AppConst.width * 0.4,
                    height: 52.h,
                    color: AppConst.kBlueLight,
                    text: 'Start Time'),
                CustomOutlineButton(
                    onTap: () {},
                    width: AppConst.width * 0.4,
                    height: 52.h,
                    color: AppConst.kBlueLight,
                    text: 'End Time'),
              ],
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
              onTap: () {},
              width: AppConst.width,
              height: 52,
              color: AppConst.kLight,
              text: 'Submit',
              color2: AppConst.kGreen,
            ),
          ],
        ),
      ),
    );
  }
}
