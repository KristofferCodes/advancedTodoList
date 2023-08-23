import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../common/widgets/appstyle.dart';
import '../../../common/widgets/custom.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../../common/widgets/reusable_text.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.height,
      width: AppConst.width,
      color: AppConst.kbkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Lottie.asset('assets/onboard1.json'),
          ),
          const HeightSpacer(height: 50),
          CustomOutlineButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              width: AppConst.width * 0.9,
              height: AppConst.height * 0.06,
              color: AppConst.kLight,
              text: 'Login with a phone number')
        ],
      ),
    );
  }
}
