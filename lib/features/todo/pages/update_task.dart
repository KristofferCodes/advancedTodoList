import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/custom.dart';
import 'package:advanced_todo_list/common/widgets/custom_text_field.dart';
import 'package:advanced_todo_list/common/widgets/height_spacer.dart';
import 'package:advanced_todo_list/features/todo/controllers/dates/dates_provider.dart';
import 'package:advanced_todo_list/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

import '../../../common/models/task_model.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask({super.key, required this.id});

  final int id;

  @override
  ConsumerState<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController title = TextEditingController(text: titles);
  final TextEditingController description = TextEditingController(text: descs);
  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);
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
              controller: description,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.bold),
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 6, 1),
                    maxTime: DateTime(2024, 6, 1),
                    theme: const picker.DatePickerTheme(
                        doneStyle:
                            TextStyle(color: AppConst.kbkDark, fontSize: 16)),
                    onChanged: (date) {
                  print('change $date in time zone ' +
                      date.timeZoneOffset.inHours.toString());
                }, onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setdate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConst.width,
              height: 52.h,
              color: AppConst.kLight,
              text: scheduleDate == ''
                  ? "set Date"
                  : scheduleDate.substring(0, 10),
              color2: AppConst.kBlueLight,
            ),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineButton(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.width * 0.4,
                    height: 52.h,
                    color: AppConst.kBlueLight,
                    text: start == "" ? 'Start Time' : start.substring(10, 16)),
                CustomOutlineButton(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.width * 0.4,
                    height: 52.h,
                    color: AppConst.kBlueLight,
                    text:
                        finish == "" ? 'Finish Time' : finish.substring(10, 16))
              ],
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
              onTap: () {
                if (title.text.isNotEmpty &&
                    description.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    start.isNotEmpty &&
                    finish.isNotEmpty) {
                  ref.read(todoStateProvider.notifier).updateItem(
                      widget.id,
                      title.text,
                      description.text,
                      0,
                      scheduleDate,
                      start.substring(0, 10),
                      finish.substring(0, 10));
                  ref.read(finishTimeStateProvider.notifier).setStart('');
                  ref.read(startTimeStateProvider.notifier).setStart('');
                  ref.read(dateStateProvider.notifier).setdate('');
                  Navigator.pop(context);
                } else {
                  print('failed to add task');
                }
              },
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
