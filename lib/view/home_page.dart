// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/Widget/check_interenetpopup.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Constants/images.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../Widget/background.dart';
import 'Drawer/drawer.dart';
import 'history_screen.dart';
import 'upgradeplanscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldd = GlobalKey();
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Form(
        key: _key,
        child: Scaffold(
          key: scaffoldd,
          drawer: Drawerpage(),
          appBar: AppBar(
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                scaffoldd.currentState?.openDrawer();
              },
              child: Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  // color: Colors.white10,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  Images.drawer,
                  fit: BoxFit.contain,
                  height: 35,
                  width: 35,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(History_Screen(), transition: Transition.upToDown);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    // color: Colors.white10,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Image.asset(
                    Images.history,
                    fit: BoxFit.contain,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              10.boxW(),
            ],
            title: Text(
              'BTC Mining',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    margin: EdgeInsets.fromLTRB(14, 18, 14, 18),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0XFF151414),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xffC1120E), width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your Current Point',
                              style: TextStyle(color: Color(0xffC1120E), fontSize: 15),
                            ),
                            Text(
                              '1234.00045614',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        VerticalDivider(color: Colors.white, endIndent: 8, indent: 8, thickness: 1.5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Point Per Hr',
                              style: TextStyle(color: Color(0xffC1120E), fontSize: 15),
                            ),
                            Text(
                              '+ 9.00',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  10.boxH(),
                  Container(
                    height: 170,
                    width: 170,
                    // color: Colors.white,
                    child: Image.asset(
                      Images.start,
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.boxH(),
                  Text(
                    '*Immediately Start this process & Earn BTC',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  14.boxH(),
                  Container(
                    // height: 90,
                    margin: EdgeInsets.fromLTRB(14, 18, 14, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0XFF151414),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xffC1120E), width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Current Plan',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => UpgradePlanScreen(), transition: Transition.downToUp);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(22, 12, 22, 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffC1120E),
                              boxShadow: [
                                const BoxShadow(
                                  offset: Offset(-10, -10),
                                  blurRadius: 3,
                                  // spreadRadius:8,
                                  color: Color(0xffC1120E),
                                  inset: true,
                                ),
                                BoxShadow(
                                  offset: Offset(6, 6),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  color: Colors.black.withOpacity(0.3),
                                  inset: true,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Upgrade',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                5.boxW(),
                                Image.asset(
                                  Images.right_arrow,
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 90,
                    margin: EdgeInsets.fromLTRB(14, 18, 14, 18),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0XFF151414),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Color(0xffC1120E), width: 1.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Mining',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '57,000',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
