import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../Constants/images.dart';
import '../Widget/background.dart';
import '../Widget/common_simple_screen.dart';
import 'history_screen.dart';

class Withdraw_Screen extends StatefulWidget {
  const Withdraw_Screen({super.key});

  @override
  State<Withdraw_Screen> createState() => _Withdraw_ScreenState();
}

class _Withdraw_ScreenState extends State<Withdraw_Screen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: true,
        rightIcon: Images.history,
        title: 'Withdraw',
        rightonTap: () {
          Get.to(History_Screen(),transition: Transition.upToDown);
        },
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 90,
                    margin: const EdgeInsets.fromLTRB(18, 22, 18, 18),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0XFF151414),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xffC1120E), width: 1.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Your Current Points',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        14.boxH(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
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
                            '1245.008910',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 90,
                    margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0XFF151414),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xffC1120E), width: 1.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            '●  We accept Binance, Trust, Coinomi and Coinbase wallet for now.',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        14.boxH(),
                        Container(
                          alignment: Alignment.centerLeft,
                          // padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffC1120E), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              print(value);
                            },
                            cursorColor: Color(0xffC1120E),
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                            decoration: InputDecoration(
                                hintText: "Enter Withdraw Address",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    height: 2,
                                    fontWeight: FontWeight.w500),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(14, 0, 0, 0)),
                          ),
                        ),
                        14.boxH(),
                        Container(
                          alignment: Alignment.centerLeft,
                          // padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffC1120E), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              print(value);
                            },
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                            cursorColor: Color(0xffC1120E),
                            decoration: InputDecoration(
                                hintText: "Enter Shiba Amount",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    height: 2,
                                    fontWeight: FontWeight.w500),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(14, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 35, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '*Minimum Withdrawal  1.5 BTC',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  25.boxH(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
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
                      'Withdraw',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
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
