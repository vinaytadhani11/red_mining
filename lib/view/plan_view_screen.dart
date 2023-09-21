import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/upgradeplanController.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

import '../Widget/background.dart';

class Plan_View_Screen extends StatefulWidget {
  const Plan_View_Screen({super.key});

  @override
  State<Plan_View_Screen> createState() => _Plan_View_ScreenState();
}

class _Plan_View_ScreenState extends State<Plan_View_Screen> {
  final con = Get.put(upgradePlanController());

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Scaffold(
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
          title: Text(
            con.selectData.value?.planName ?? "",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Obx(
          () => ConmanLoader(
            loadingState: con.isLoading.value,
            child: SafeArea(
              child: Column(
                children: [
                  35.boxH(),
                  Container(
                    // height: 90,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0XFF151414),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffC1120E), width: 1.0),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: -30,
                          right: 60,
                          left: 60,
                          child: Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffC1120E),
                            ),
                            child: Text(
                              con.selectData.value?.planName ?? "",
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            22.boxH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Speed :  ',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${con.selectData.value?.speed} GH/s',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            10.boxH(),
                            const Red_Divider(),
                            10.boxH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Availability :  ',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  con.selectData.value?.availability ?? "",
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            10.boxH(),
                            const Red_Divider(),
                            10.boxH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Withdrawal :  ',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  con.selectData.value?.minimumWithdraw ?? "",
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            10.boxH(),
                            const Red_Divider(),
                            10.boxH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Contract :  ',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  (con.selectData.value?.contract.toString() ?? ""),
                                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            10.boxH(),
                            const Red_Divider(),
                            10.boxH(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  14.boxH(),
                  InkWell(
                    onTap: () {
                      con.addPlan();
                    },
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffC1120E),
                      ),
                      child: const Text(
                        'BUY NOW',
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                      ),
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

class Red_Divider extends StatelessWidget {
  const Red_Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 90,
          colors: [
            const Color(0xffC1120E).withOpacity(.4),
            const Color(0xffC1120E).withOpacity(0),
          ],
        ),
      ),
    );
  }
}
