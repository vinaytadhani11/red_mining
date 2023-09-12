import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../../Widget/background.dart';
import '../../Widget/common_simple_screen.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Leaderboard',
        child: SafeArea(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10)),
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
                                spreadRadius:1,
                                color: Colors.black.withOpacity(0.3),
                                inset: true,
                              ),
                            ], 
                          ),
                          child: Text(
                            '19383.983',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${index}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                10.boxW(),
                                const Text(
                                  'BTC Mining',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                10.boxW(),
                                const Text(
                                  '15/12/2022',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
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
    );
  }
}
