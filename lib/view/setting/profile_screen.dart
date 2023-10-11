import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';
import 'package:redbtc_mining_app/controllers/profile_controller.dart';
import 'package:redbtc_mining_app/extensions/validations.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/Widget/common_simple_screen.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../../Constants/images.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  final con = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'About Us ',
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(14),
                    height: 200, width: 200,
                    // color: Colors.white,
                    child: Image.asset(
                      Images.profile_1,
                      fit: BoxFit.contain,
                    ),
                  ),
                  18.boxH(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0XFF151414),
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffC1120E),
                          offset: Offset(0, 0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        22.boxH(),
                        TextFormField(
                          // controller: fullNameController,
                          onChanged: (value) {
                            print(value);
                          },
                          cursorColor: Color(0xffC1120E),
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "First Name",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                Images.user,
                                color: Colors.white,
                                fit: BoxFit.contain,
                                height: 22,
                                width: 18,
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                            ),
                          ),
                        ),
                        14.boxH(),
                        TextFormField(
                          // controller: emailController,
                          onChanged: (value) {
                            print(value);
                          },
                          cursorColor: Color(0xffC1120E),
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                Images.user,
                                color: Colors.white,
                                fit: BoxFit.contain,
                                height: 22,
                                width: 18,
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                color: Color(0xffC1120E),
                              ),
                            ),
                          ),
                        ),
                        14.boxH(),
                        TextFormField(
                          // controller: emailController,
                          onChanged: (value) {
                            print(value);
                          },
                          cursorColor: Color(0xffC1120E),
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Email address",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/images/massage.webp',
                                fit: BoxFit.contain,
                                height: 22,
                                width: 18,
                              ),
                            ),
                            hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                            ),
                          ),
                        ),
                        10.boxH(),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
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
                            'UPDATE',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(barrierColor: Colors.grey.shade800.withOpacity(.3), passwordPopup(), barrierDismissible: true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              color: Color(0xffC1120E),
                              radius: Radius.circular(100),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)
                                    // color: const Color(0xffC1120E),
                                    ),
                                child: const Text(
                                  'CHANGE PASSWORD',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
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

  Widget passwordPopup() {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.only(left: 8, right: 8),
      child: Stack(
        children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.only(top: 60, bottom: 20),
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color(0xffC1120E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40),
                  const Text("Change Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10),
                  TextFormField(
                    // controller: emailController,
                    onChanged: (value) {
                      print(value);
                    },
                    controller: con.currentPassTC,
                    cursorColor: Color(0xffC1120E),
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: "Current Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          Images.passPrivacy,
                          fit: BoxFit.contain,
                          height: 20,
                          width: 18,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    // controller: emailController,
                    controller: con.newPassTC,
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (!Validator.isPasswordValid(value)) {
                        return 'Confirm Password is not matches with condition\n- 8 characters long\n- one uppercase letter\n- one lowercase letter\n- one digit\n- not containing special characters';
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Color(0xffC1120E),
                    style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      hintText: "New Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          Images.passPrivacy,
                          fit: BoxFit.contain,
                          height: 20,
                          width: 18,
                        ),
                      ),
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: con.confirmPassTC,
                    // controller: emailController,
                    onChanged: (value) {
                      print(value);
                    },
                    cursorColor: Color(0xffC1120E),
                    style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      } else if (!Validator.isPasswordValid(value)) {
                        return 'Confirm Password is not matches with condition\n- 8 characters long\n- one uppercase letter\n- one lowercase letter\n- one digit\n- not containing special characters';
                      } else if (con.newPassTC.text != value) {
                        return 'Password and Confirm Password are not the same';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm New Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          Images.passPrivacy,
                          fit: BoxFit.contain,
                          height: 20,
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
                        borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffC1120E),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "CLOSE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            con.updatePasswordAPI();
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xffC1120E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "UPDATE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xffC1120E), width: 5),
                ),
                child: Image.asset(
                  "assets/images/no_internat.png",
                  height: 50,
                ),
              )),
        ],
      ),
    );
  }
}
