import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../controllers/menu_controller.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "MATRIX HR",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: "assets/menu_home.png",
              press: () {
                context.read<MenuuController>().index = 0;

              },
            ),
            DrawerListTile(
              title: "Products",
              icon: "assets/menu_recruitment.png",
              press: () {
                context.read<MenuuController>().index = 1;

              },
            ),
            DrawerListTile(
              title: "Coupens",
              icon: "assets/menu_onboarding.png",
              press: () {
                context.read<MenuuController>().index = 2;

              },
            ),
            // DrawerListTile(
            //   title: "Reports",
            //   icon: "assets/menu_report.png",
            //   press: () {
            //     context.read<MenuuController>().index = 3;

            //   },
            // ),
            // DrawerListTile(
            //   title: "Calendar",
            //   icon: "assets/menu_calendar.png",
            //   press: () {
            //     context.read<MenuuController>().index = 4;

            //   },
            // ),
            // DrawerListTile(
            //   title: "Settings",
            //   icon: "assets/menu_settings.png",
            //   press: () {
            //     context.read<MenuuController>().index = 5;
            //   },
            // ),
            const Spacer(),
            Image.asset("assets/sidebar_image.png")
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;

  const DrawerListTile({super.key, required this.title, required this.icon, required this.press});

  // const DrawerListTile({Key key, this.title, this.icon, this.press})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        color: AppColor.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
