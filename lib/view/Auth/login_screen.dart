import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/controllers/auth_controller.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Constants/images.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../../Widget/background.dart';
import '../home_page.dart';
import 'forget_screen.dart';
import 'register_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  // show the password or not

  final con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Form(
        key: con.logInFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 25),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.white,\
                      ),
                  child: const Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                25.boxH(),
                Container(
                  padding: const EdgeInsets.fromLTRB(21, 0, 21, 21),
                  // color: Color(0xffC1120E),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffC1120E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 18),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xffC1120E),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Login to Your Account',
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
                              Text(
                                'Log In',
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              22.boxH(),
                              TextFormField(
                                controller: con.emailTC,
                                onChanged: (value) {
                                  print(value);
                                },
                                validator: (value) {
                                  if (value?.isEmpty ?? false) {
                                    return 'Please enter your email';
                                  }
                                  return null;
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
                                  hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                  enabledBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              14.boxH(),
                              Obx(
                                () => TextFormField(
                                  obscureText: con.isObscure.value, //show/hide password
                                  controller: con.passTC,
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  cursorColor: Color(0xffC1120E),
                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffC1120E),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/password.webp',
                                        fit: BoxFit.contain,
                                        height: 22,
                                        width: 18,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      //<-- SEE HERE
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(11),
                                      child: GestureDetector(
                                          onTap: () {
                                            con.isObscure.value = !con.isObscure.value;
                                          },
                                          child: con.isObscure.value
                                              ? Image.asset(
                                                  'assets/images/show_eye.webp',
                                                  fit: BoxFit.contain,
                                                  height: 22,
                                                  width: 18,
                                                )
                                              : Image.asset(
                                                  'assets/images/close_eye.webp',
                                                  fit: BoxFit.contain,
                                                  height: 22,
                                                  width: 18,
                                                )),
                                    ),
                                  ),
                                  // IconButton(
                                  //   icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _isObscure = !_isObscure;
                                  //     },);
                                  //   },),
                                  // ),
                                ),
                              ),
                              14.boxH(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Forget_Password(), transition: Transition.rightToLeftWithFade);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(18, 0, 18, 0),
                                      child: Text(
                                        'Forget Password?',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              14.boxH(),
                              InkWell(
                                onTap: con.signInWithEmailPassword,
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: Color(0xffC1120E),
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
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 1,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          gradient: RadialGradient(radius: 80, colors: [
                                        const Color(0xff8AC7FF).withOpacity(.4),
                                        const Color(0xff8AC7FF).withOpacity(0),
                                      ])),
                                    )),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        "OR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: 1,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          gradient: RadialGradient(radius: 80, colors: [
                                        const Color(0xff8AC7FF).withOpacity(.4),
                                        const Color(0xff8AC7FF).withOpacity(0),
                                      ])),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Sign In With',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                              14.boxH(),
                              InkWell(
                                onTap: () {
                                  con.signInWithGoogle();
                                },
                                child: Container(
                                  height: 54,
                                  width: 54,
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    color: Color(0xffC1120E),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    Images.gpay_login,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              14.boxH(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "You don't an account?",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.offAll(() => Register_screen(), transition: Transition.rightToLeftWithFade);
                                    },
                                    child: Text(
                                      " Register",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffC1120E),
                                      ),
                                    ),
                                  ),
                                ],
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
    );
  }
}
