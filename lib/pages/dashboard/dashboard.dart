import 'package:flutter/material.dart';
import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import 'widget/header_widget.dart';
import 'widget/notification_card_widget.dart';
import 'widget/profile_card_widget.dart';
import 'widget/recruitment_data_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          /// Header Part
          HeaderWidget(title:             "Dashboard",),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          NotificationCardWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          if (AppResponsive.isMobile(context)) ...{
                            // CalendarWidget(),
                            SizedBox(
                              height: 20,
                            ),
                          },
                          RecruitmentDataWidget(),
                        ],
                      ),
                    ),
                  ),
                  if (!AppResponsive.isMobile(context))
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            // CalendarWidget(),
                            ProfileCardWidget(),

                            SizedBox(
                              height: 20,
                            ),
                            ProfileCardWidget(),
                             SizedBox(
                              height: 20,
                            ),
                            ProfileCardWidget(),
                             SizedBox(
                              height: 20,
                            ),
                            ProfileCardWidget(),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
