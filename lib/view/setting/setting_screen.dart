import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Constants/images.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import 'package:redbtc_mining_app/view/setting/referandfriend_screen.dart';

import '../../Widget/background.dart';
import '../../Widget/common_simple_screen.dart';
import 'about_us_screen.dart';
import 'contact_us_screen.dart';
import 'leaderboard_screen.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({super.key});

  @override
  State<Setting_Screen> createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Setting',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  height: 200,width: 200,
                  // color: Colors.white,
                  child: Image.asset(Images.settings_2,fit: BoxFit.contain,height: 180,width: 180,),
                ),
                18.boxH(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  padding:EdgeInsets.symmetric(vertical: 22),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0XFF151414),
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffC1120E),
                        offset: Offset(0, 0),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SettingTile(
                        text: 'Refer a Friend',
                        image: Images.refer_earn,
                        onTap: (){
                          Get.to(ReferFriend_Screen(),transition: Transition.leftToRightWithFade);
                        },
                      ),
                      Divider(color: Color(0xffC1120E),endIndent: 14,indent: 14,thickness: 1.0),
                      SettingTile(
                        text: 'Leaderboard',
                        image: Images.leaderboard,
                        onTap: (){
                          Get.to(LeaderboardScreen(),transition: Transition.leftToRightWithFade);
                        },
                      ),
                      Divider(color: Color(0xffC1120E),endIndent: 14,indent: 14,thickness: 1.0),
                      SettingTile(
                        text: 'Contact Us',
                        image: Images.contact,
                        onTap: (){
                          Get.to(ContactUs_Screen(),transition: Transition.leftToRightWithFade);
                        },
                      ),
                      Divider(color: Color(0xffC1120E),endIndent: 14,indent: 14,thickness: 1.0),
                      SettingTile(
                        text: 'About Us',
                        image: Images.about_us_2,
                        onTap: (){
                          Get.to(AboutusScreen(),transition: Transition.leftToRightWithFade);
                        },
                      ),
                      Divider(color: Color(0xffC1120E),endIndent: 14,indent: 14,thickness: 1.0),
                      SettingTile(
                        text: 'Policy Privacy',
                        image: Images.privacy_policy_1,
                        onTap: (){},
                      ),
                      Divider(color: Color(0xffC1120E),endIndent: 14,indent: 14,thickness: 1.0),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  String? image;
  String? text;
  void Function()? onTap;
  SettingTile({
    super.key,this.image,this.text,this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
        decoration: const BoxDecoration(
          // color: Color(0XFF070707),
          // borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              // color: ColorConstants.main,
              image: AssetImage(
                image??"",
              ),
              height: 28,
              width: 28,
              alignment: Alignment.topCenter,
            ),
            18.boxW(),
            Text(
              text??"",
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
