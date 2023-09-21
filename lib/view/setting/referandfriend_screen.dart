import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/refer_controller.dart';
import 'package:redbtc_mining_app/utils/app_function.dart';
import 'package:share_plus/share_plus.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/Widget/common_simple_screen.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

class ReferFriend_Screen extends StatefulWidget {
  const ReferFriend_Screen({super.key});

  @override
  State<ReferFriend_Screen> createState() => _ReferFriend_ScreenState();
}

class _ReferFriend_ScreenState extends State<ReferFriend_Screen> {
  final con = Get.put(ReferController());

  @override
  void initState() {
    con.getUserInfo();
    con.getReferralsHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Refer a Friends ',
        child: SafeArea(
          child: Obx(
            () => ConmanLoader(
              loadingState: con.isLoading.value,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 90,
                        // margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0XFF151414),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffC1120E), width: 1.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Refer a Friends',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Color(0xffC1120E), fontSize: 15),
                            ),
                            const Text(
                              'You and your friend will get XX free BTC Coin when your friends join mining community  ',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            14.boxH(),
                            Container(
                              alignment: Alignment.centerLeft,
                              // padding: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: const Color(0xffC1120E), width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                readOnly: true,
                                onChanged: (value) {
                                  print(value);
                                },
                                obscureText: true,
                                obscuringCharacter: "x",
                                controller: TextEditingController(text: con.userInfoModel.value?.data?.referralCode ?? ""),
                                textAlign: TextAlign.start,
                                style: const TextStyle(color: Colors.white, fontSize: 17),
                                cursorColor: Color(0xffC1120E),
                                decoration: const InputDecoration(
                                    hintText: "Enter Shiba Amount",
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.white, height: 2, fontWeight: FontWeight.w500),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.fromLTRB(14, 0, 0, 0)),
                              ),
                            ),
                            14.boxH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: con.userInfoModel.value?.data?.referralCode ?? "")).then((value) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Copied to Clipboard')),
                                      );
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(color: const Color(0xffC1120E), width: 1.5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Copy',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Share.share("Scoreboard \n${con.userInfoModel.value?.data?.referralCode ?? ""}");
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                                    // margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                    child: const Text(
                                      'Share',
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Received Rewards",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      receivedRewardsList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget receivedRewardsList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xff151414), boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: .5,
                color: Color(0xffC1120E),
                offset: Offset(0, 1.5),
              ),
            ]),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "1.",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phillip Press",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "phillippress@gmail.com",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xffC1120E),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "+12",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
