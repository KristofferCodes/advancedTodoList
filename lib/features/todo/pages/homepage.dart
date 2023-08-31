import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:advanced_todo_list/common/widgets/appstyle.dart';
import 'package:advanced_todo_list/common/widgets/custom_text_field.dart';
import 'package:advanced_todo_list/common/widgets/reusable_text.dart';
import 'package:advanced_todo_list/features/todo/pages/add.dart';
import 'package:advanced_todo_list/features/todo/widgets/tomorrow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/height_spacer.dart';
import '../widgets/completed_tasks.dart';
import '../widgets/day_after_tomorrow.dart';
import '../widgets/today_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                            text: 'Dashboard',
                            style:
                                appstyle(18, AppConst.kLight, FontWeight.bold)),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: const BoxDecoration(
                              color: AppConst.kLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9))),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddTask()));
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppConst.kbkDark,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 20),
                  CustomTextField(
                    hintText: 'Search',
                    controller: search,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(14),
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(
                          AntDesign.search1,
                          color: AppConst.kGreyLight,
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      FontAwesome.sliders,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                  const HeightSpacer(height: 15)
                ],
              )),
        ),
        backgroundColor: AppConst.kbkDark,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(children: [
              const HeightSpacer(height: 25),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  const WidthSpacer(width: 10),
                  ReusableText(
                      text: 'Todays Task',
                      style: appstyle(18, AppConst.kLight, FontWeight.bold))
                ],
              ),
              const HeightSpacer(height: 25),
              Container(
                decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.radius))),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConst.kGreyLight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.radius)),
                    ),
                    controller: tabController,
                    labelColor: AppConst.kBlueLight,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    unselectedLabelColor: AppConst.kLight,
                    labelStyle:
                        appstyle(24, AppConst.kBlueLight, FontWeight.bold),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConst.width * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: 'Pending',
                                style: appstyle(
                                    16, AppConst.kbkDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.only(left: 40.0),
                          width: AppConst.width * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: 'Completed',
                                style: appstyle(
                                    16, AppConst.kbkDark, FontWeight.bold)),
                          ),
                        ),
                      )
                    ]),
              ),
              const HeightSpacer(height: 20),
              SizedBox(
                height: AppConst.height * 0.3,
                width: AppConst.width,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.radius)),
                  child: TabBarView(controller: tabController, children: [
                    Container(
                        color: AppConst.kbkLight,
                        height: AppConst.height * 0.3,
                        child: const TodaysTask()),
                    Container(
                      color: AppConst.kbkLight,
                      height: AppConst.height * 0.3,
                      child: const CompletedTask(),
                    ),
                  ]),
                ),
              ),
              const HeightSpacer(height: 20),
              const TomorrowList(),
              const HeightSpacer(height: 20),
              const DayAfterTomorrowList()
            ]),
          ),
        ));
  }
}

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key,
    required int width,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
    );
  }
}
