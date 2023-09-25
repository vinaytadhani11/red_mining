import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/mining_history_controller.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import '../Constants/images.dart';
import '../Widget/background.dart';

class History_Screen extends StatefulWidget {
  const History_Screen({super.key});
  @override
  State<History_Screen> createState() => _History_ScreenState();
}

class _History_ScreenState extends State<History_Screen> {
  final con = Get.put(MiningHistoryController());

  @override
  void initState() {
    con.getMiningHistory();
    super.initState();
  }

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
          title: const Text(
            'History ',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          // actions: [
          //   InkWell(
          //     onTap: () {
          //       Get.to(History_Screen(), transition: Transition.upToDown);
          //     },
          //     child: Container(
          //       height: 28,
          //       width: 28,
          //       padding: EdgeInsets.all(2),
          //       decoration: BoxDecoration(
          //         // color: Colors.white10,
          //         borderRadius: BorderRadius.circular(40),
          //       ),
          //       child: Image.asset(
          //         Images.delete,
          //         fit: BoxFit.contain,
          //         height: 30,
          //         width: 30,
          //       ),
          //     ),
          //   ),
          //   18.boxW(),
          // ],
        ),
        backgroundColor: Colors.transparent,
        body: Obx(
          () => ConmanLoader(
            loadingState: con.isLoading.value,
            child: SafeArea(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: con.miniList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = con.miniList[index];
                  return InkWell(
                    onTap: () {
                      // Get.to(Plan_View_Screen(),transition: Transition.fadeIn);
                    },
                    child: Container(
                      // height: 90,
                      margin: const EdgeInsets.fromLTRB(18, 13, 18, 13),
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0XFF151414),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1,
                            color: Color(0xffC1120E),
                            offset: Offset(2, 2),
                          ),
                          // BoxShadow(
                          //   offset: Offset(-3, 0),
                          // ),
                          BoxShadow(
                            blurRadius: 1,
                            offset: Offset(2, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
                              child: Column(
                                children: [
                                  Text(
                                    data.mining == "null" ? "0.0" : data.mining ?? "",
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Point Per Hr',
                                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'BTC Mining',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    10.boxH(),
                                    Text(
                                      DateFormat('yyyy/MM/dd').format(DateTime.parse(data.date ?? "")).toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
