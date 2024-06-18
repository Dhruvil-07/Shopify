import 'package:admin_panel/Utils/Instances.dart';
import 'package:admin_panel/view/BrandView/BrandView.dart';
import 'package:admin_panel/view/CategoryView/CategoryView.dart';
import 'package:admin_panel/view/CouponView/CouponView.dart';
import 'package:admin_panel/view/DashboardView/DashboardView.dart';
import 'package:admin_panel/view/NotificationView/NotificationView.dart';
import 'package:admin_panel/view/OrderView/OrderView.dart';
import 'package:admin_panel/view/PosterView/PosterView.dart';
import 'package:admin_panel/view/SubCategory/SubCategoryView.dart';
import 'package:admin_panel/view/VariantTypeView/VariantTypeView.dart';
import 'package:admin_panel/view/VariantView/VariantView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PanelView extends StatefulWidget {
  const PanelView({Key? key}) : super(key: key);
  @override
  State<PanelView> createState() => _PanelViewState();
}

class _PanelViewState extends State<PanelView> {

  List<String> title = ["Dashboard","Category","Sub Category","Brands", "Variant Type" , "Variants" ,"Orders" ,"Coupons" ,"Posters" ,"Notifications"];
  List<String> icons = ["assets/Icons/menu_dashboard.svg","assets/Icons/menu_tran.svg","assets/icons/menu_task.svg","assets/icons/menu_doc.svg",
    "assets/icons/menu_store.svg","assets/icons/menu_notification.svg","assets/icons/menu_profile.svg",
    "assets/icons/menu_setting.svg","assets/icons/menu_doc.svg","assets/icons/menu_notification.svg",
  ];

  List<Widget> pages = [DashBoardView(),Categoryview(),SubCategoryView(),BrandView(),VariantTypeView(),VariantView(),OrderView(),CouponView(),PosterView(),NotificationView()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width:  MediaQuery.sizeOf(context).width,
        child: Row(
          children: [

            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width*0.18,
              child: Drawer(
                  child: Column(
                    children: [

                      DrawerHeader(
                        child: Image.asset("assets/images/logo.png"),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: title.length,
                        itemBuilder: (context, idx){
                          return DrawerListTile(
                            title: title[idx],
                            svgSrc: icons[idx],
                            press: () {
                                setState(() {
                                   index = idx;
                                });
                            },
                          );
                        },
                      ),


                    ],
                  )
                ),
              ),

            Expanded(
              child: Container(
                child: pages[index],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
