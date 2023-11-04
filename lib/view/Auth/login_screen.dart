import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/Widget/common_loader.dart';
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
  final logInFormKey = GlobalKey<FormState>();

  final con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Obx(
        () => ConmanLoader(
          loadingState: con.isLoading.value,
          child: Form(
            key: logInFormKey,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 25),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
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
                          color: const Color(0xffC1120E),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 18),
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
                                  const Text(
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
                                    cursorColor: const Color(0xffC1120E),
                                    style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
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
                                      cursorColor: const Color(0xffC1120E),
                                      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
                                        disabledBorder: const OutlineInputBorder(
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
                                        enabledBorder: const UnderlineInputBorder(
                                          //<-- SEE HERE
                                          borderSide: BorderSide(color: Color(0xffC1120E), width: 1.5),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
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
                                          Get.to(() => const Forget_Password(), transition: Transition.rightToLeftWithFade);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                                          child: const Text(
                                            'Forget Password?',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  14.boxH(),
                                  InkWell(
                                    // onTap: () {
                                      // // --------------------------------------------
                                      // final materialBanner = SnackBar(
                                      //   /// need to set following properties for best effect of awesome_snackbar_content
                                      //   elevation: 0,  
                                      //   backgroundColor: Colors.transparent,
                                      //   // forceActionsBelow: true,
                                      //   content: AwesomeSnackbarContent(
                                      //     title: 'Oh Hey!!',
                                      //     message:
                                      //         'This is an example error message that will be shown ',
                                      //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                      //     contentType: ContentType.success,
                                      //     // to configure for material banner
                                      //     inMaterialBanner: true,
                                      //   ),
                                      //   // actions: const [SizedBox.shrink()],
                                      // );
                                      // ScaffoldMessenger.of(context)
                                      //   ..hideCurrentMaterialBanner()
                                      //   ..showSnackBar(materialBanner);
                                      // // --------------------------------------------
                                      // con.loginApiCalling();
                                    // },
                                    onTap: con.loginApiCalling,
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
                                            offset: const Offset(6, 6),
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
                                    child: const Text(
                                      'Sign In With',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                  14.boxH(),
                                  InkWell(
                                    onTap: () {
                                      // con.signInWithGoogle();
                                    },
                                    child: Container(
                                      height: 54,
                                      width: 54,
                                      padding: const EdgeInsets.all(13),
                                      decoration: const BoxDecoration(
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
                                      const Text(
                                        "You don't an account?",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const Register_screen(), transition: Transition.rightToLeftWithFade);
                                        },
                                        child: const Text(
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
        ),
      ),
    );
  }
}
