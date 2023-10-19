// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:redbtc_mining_app/controllers/home_controller.dart';

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
  final con = Get.put(HomeController());

  @override
  void initState() {
    con.sokectIO();
    super.initState();
  }

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
          drawer: Drawbridge(),
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
            child:
                //  StreamBuilder(
                //   stream: con.streamSocket.getResponse,
                //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                //     return Container(
                //       child: Text(snapshot.data ?? ""),
                //     );
                //   },
                // ),
                SingleChildScrollView(
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
                    child: Obx(
                      () => Row(
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
                                con.socketIoModel.value?.mining ?? "0.0000000",
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
                                con.socketIoModel.value?.currentSpeed ?? "0.0000",
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.boxH(),
                  // InkWell(
                  //   onTap: () {
                  //     con.sendMessage();
                  //   },
                  //   child: Container(
                  //     height: 170,
                  //     width: 170,
                  //     // color: Colors.white,
                  //     child: Image.asset(
                  //       Images.start,
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  Obx(
                    () => AnimatedScale(
                      scale: con.isBig.value ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 50),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: () {
                          con.isConnecting.value == true ? con.startingMining() : null;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5,
                              color: Color(0xffC1120E),
                            ),
                          ),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            height: 135,
                            width: 135,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                                  child: Image.asset(
                                    Images.bitcoin,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom: -110,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: 170,
                                    padding: EdgeInsets.only(top: con.isMiningStart.value == false ? 27 : 27),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Color(0xffC1120E),
                                      ),
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      con.isConnecting.value == false
                                          ? "Connecting"
                                          : con.isMiningStart.value == false
                                              ? "Start"
                                              : con.socketIoModel.value?.timeString ?? "Connecting",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: con.isMiningStart.value == false ? 15 : 15, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
