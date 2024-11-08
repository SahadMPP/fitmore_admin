import 'package:fitmore_admin/controllers/side_bar/menu_controller.dart';
import 'package:fitmore_admin/view/coupons/coupon_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_hr_management/controllers/menu_controller.dart';
// import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../dashboard/dashboard.dart';
import '../product/product_list.dart';
import '../widget/side_bar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pageList = [
    const Dashboard(),
    const ProdectList(),
    const CouponList(),
    // Placeholder(color: Colors.purple),
    // Placeholder(color: Colors.cyan),
    // Placeholder(color: Colors.blue),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      key: Provider.of<MenuuController>(context, listen: false).scaffoldKey,
      backgroundColor: AppColor.bgSideMenu,
      body:
          Consumer<MenuuController>(builder: (context, menuController, child) {
        return SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Side Navigation Menu
              /// Only show in desktop
              if (AppResponsive.isDesktop(context))
                const Expanded(
                  child: SideBar(),
                ),

              /// Main Body Part
              Expanded(
                flex: 4,
                child: pageList[menuController.index],
              ),
            ],
          ),
        );
      }),
    );
  }
}
