import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/auth_controller.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Constants/images.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

import '../../Widget/background.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  // show the password or not
  // bool isObscure = true;
  // static final _key = GlobalKey<FormState>();
  // TextEditingController textEditConEmail = TextEditingController();
  // TextEditingController textEditConPassword = TextEditingController();
  // bool isPressed = true;

  final con = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Offset distance = con.isPressed ? Offset(2, 2) : Offset(5, 5);
    double blur = con.isPressed ? 4.0 : 8.0;
    return Mainbackground(
      child: Obx(
        () => ConmanLoader(
          loadingState: con.isLoading.value,
          child: Form(
            key: con.key,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          // color: Colors.white,
                          ),
                      child: const Text(
                        'Forgot Your Password',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    25.boxH(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(21, 0, 21, 21),
                      // color: Color(0xffC1120E),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffC1120E),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 18),
                              decoration: const BoxDecoration(
                                color: Color(0xffC1120E),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(14, 22, 14, 14),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xff151414),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  // Spacer(),
                                  // Please enter the Email Address you’d like your password reset information sent to.
                                  const Text(
                                    'Forgot Password',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  36.boxH(),
                                  const Text(
                                    "Please enter the Email Address you'd like your password reset information sent to.",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  14.boxH(),
                                  TextFormField(
                                    controller: con.textEditConEmail,
                                    onChanged: (value) {
                                      print(value);
                                    },
                                    cursorColor: Color(0xffC1120E),
                                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      hintText: "Email Id",
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/images/massage.webp',
                                          fit: BoxFit.contain,
                                          height: 22,
                                          width: 18,
                                        ),
                                      ),
                                      hintStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                      enabledBorder: const UnderlineInputBorder(
                                        //<-- SEE HERE
                                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        //<-- SEE HERE
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  22.boxH(),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: const Color(0xffC1120E),
                                        borderRadius: BorderRadius.circular(100),
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
                                        'LOGIN',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  22.boxH(),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      'Back To Login',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xffC1120E),
                                          decorationThickness: 1.5,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  14.boxH(),
                                  Container(
                                    height: 180,
                                    width: 180,
                                    // color: Colors.white,
                                    child: Image.asset(
                                      Images.forget,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  // Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
