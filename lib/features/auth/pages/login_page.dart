import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/custom.dart';
import 'package:advanced_todo_list/common/widgets/height_spacer.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../common/widgets/custom_text_field.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phone = TextEditingController();
  Country country = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Key: '',
    geographic: true,
    level: 1,
    name: 'USA',
    example: 'USA',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Sc: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kbkDark,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.w),
              child: Lottie.asset('assets/login.json'),
            ),
            const HeightSpacer(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Align(
                alignment: Alignment.center,
                child: ReusableText(
                    text: 'Please enter your phone number',
                    style: appstyle(17, AppConst.kLight, FontWeight.w500)),
              ),
            ),
            const HeightSpacer(height: 20),
            Center(
              child: CustomTextField(
                controller: phone,
                hintText: 'Enter Phone Number',
                prefixIcon: Container(
                  height: 1.0,
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.height * 0.6,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(AppConst.radius),
                                  topRight: Radius.circular(AppConst.radius))),
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: ReusableText(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        style: appstyle(18, AppConst.kbkDark, FontWeight.bold)),
                  ),
                ),
                keyboardType: TextInputType.number,
                hintStyle: appstyle(14, AppConst.kbkDark, FontWeight.w600),
              ),
            ),
            const HeightSpacer(height: 20),
            CustomOutlineButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OtpPage()));
              },
              width: AppConst.width * .9,
              height: AppConst.height * .07,
              color: AppConst.kbkDark,
              text: 'Send Code',
              color2: AppConst.kLight,
            ),
          ],
        ),
      )),
    );
  }
}
