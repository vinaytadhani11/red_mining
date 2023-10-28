// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/upgradeplanController.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

import '../Widget/background.dart';
import 'plan_view_screen.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  GlobalKey<ScaffoldState> scaffoldd = GlobalKey();

  final con = Get.put(upgradePlanController());

  @override
  void initState() {
    con.getUpGradePlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Scaffold(
        key: scaffoldd,
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            'Upgrade Plans',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(
            () => ConmanLoader(
              loadingState: con.isLoading.value,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: con.updata.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = con.updata[index];
                  return InkWell(
                    onTap: () {
                      con.selectData.value = data;
                      Get.to(() => Plan_View_Screen(), transition: Transition.fadeIn);
                    },
                    child: Container(
                      // height: 90,
                      margin: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0XFF151414),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffC1120E), width: 1.0),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -30,
                            right: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffC1120E),
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
                              child: Text(
                                data.planName ?? "",
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data.price} Rs',
                                    style: const TextStyle(color: Color(0xffC1120E), fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  10.boxH(),
                                  Text(
                                    'Speed :  ${data.speed} GH/s',
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Availability :  ${data.availability}',
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Withdrawal :  ${data.minimumWithdraw ?? ""}',
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Contract :  ${data.contract ?? ""} Days',
                                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
