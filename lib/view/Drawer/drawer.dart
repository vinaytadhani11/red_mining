// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/controllers/home_controller.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import 'package:share_plus/share_plus.dart';
import '../../Constants/images.dart';
import '../Auth/login_screen.dart';
import '../setting/profile_screen.dart';
import '../setting/setting_screen.dart';
import '../upgradeplanscreen.dart';
import '../withdraw_screen.dart';

class Drawbridge extends StatefulWidget {
  const Drawbridge({Key? key}) : super(key: key);

  @override
  State<Drawbridge> createState() => _DrawbridgeState();
}

class _DrawbridgeState extends State<Drawbridge> {
  final con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 0,
        shadowColor: Color(0xffC1120E),
        surfaceTintColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), topRight: Radius.circular(50)),
            side: BorderSide(
              color: Color(0xffC1120E),
            )),
        backgroundColor: Colors.black,
        width: 240,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 14, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Container(
                height: 110,
                width: 110,
                // color: Colors.white,
                child: Image.asset(
                  Images.bitcoin,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            10.boxH(),
            Text(
              'Dixson Richard',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            8.boxH(),
            CustomListTile(Images.dashboard, 'DashBoard', () {
              Get.back();
            }),
            8.boxH(),
            CustomListTile(Images.plan, 'Upgrade Speed', () {
              Get.back();
              Get.to(UpgradePlanScreen(), transition: Transition.leftToRightWithFade);
            }),
            8.boxH(),
            CustomListTile(Images.withdraw, 'Withdraw Shiba ', () {
              Get.back();
              Get.to(Withdraw_Screen(), transition: Transition.leftToRightWithFade);
            }),
            8.boxH(),
            CustomListTile(Images.user, 'Your Profile', () {
              Get.back();
              Get.to(Profile_Screen(), transition: Transition.leftToRightWithFade);
            }),
            8.boxH(),
            CustomListTile(Images.settings_1, 'Settings', () {
              Get.back();
              Get.to(Setting_Screen(), transition: Transition.leftToRightWithFade);
            }),
            8.boxH(),
            CustomListTile(Images.share, 'Share App', () {
              Share.share("Scoreboard \n${applink}");
            }),
            8.boxH(),
            CustomListTile(Images.logout, 'Logout', () {
              con.signOut();
            }),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  String image;
  String text;
  void Function() onTap;
  CustomListTile(this.image, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
        decoration: BoxDecoration(
          color: Color(0XFF070707),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.0,
              color: Color(0xffC1120E),
              offset: Offset(0, 3),
            ),
            BoxShadow(
              offset: Offset(-3, 0),
            ),
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(3, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              // color: ColorConstants.main,
              image: AssetImage(
                image,
              ),
              height: 28,
              width: 28,
              alignment: Alignment.topCenter,
            ),
            14.boxW(),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
