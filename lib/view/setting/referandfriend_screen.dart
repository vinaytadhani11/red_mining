import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/Widget/common_simple_screen.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

import '../../Constants/images.dart';

class ReferFriend_Screen extends StatefulWidget {
  const ReferFriend_Screen({super.key});

  @override
  State<ReferFriend_Screen> createState() => _ReferFriend_ScreenState();
}

class _ReferFriend_ScreenState extends State<ReferFriend_Screen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Refer a Friends ',
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                      mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Refer a Friends',textAlign: TextAlign.start,
                          style: TextStyle(color: Color(0xffC1120E), fontSize: 15),
                        ),
                        Container(
                          child: Text(
                            'You and your friend will get XX free BTC Coin when your friends join mining community  ',
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
                            color: Colors.black,
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
                        14.boxH(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 35,vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                    color: Color(0xffC1120E), width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Copy',textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding:const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
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
