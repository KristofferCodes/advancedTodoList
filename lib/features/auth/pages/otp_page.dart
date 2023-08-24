import 'package:advanced_todo_list/common/widgets/height_spacer.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/appstyle.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kbkDark,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Lottie.asset('assets/otp.json'),
              ),
              const HeightSpacer(
                height: 26,
              ),
              ReusableText(
                  text: 'Enter your otp code',
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),
              const HeightSpacer(
                height: 26,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
