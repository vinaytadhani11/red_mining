import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import 'package:redbtc_mining_app/view/Auth/login_screen.dart';

import '../../Widget/background.dart';

class Register_screen extends StatefulWidget {
  const Register_screen({super.key});

  @override
  State<Register_screen> createState() => _Register_screenState();
}

class _Register_screenState extends State<Register_screen> {
  // show the password or not
  bool _isObscure = true;
  static final _key = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? Offset(2, 2) : Offset(5, 5);
    double blur = isPressed ? 4.0 : 8.0;
    return Mainbackground(
      child: Form(
        key: _key,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 25),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    // color: Colors.white,
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                            'Create Your New Account',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
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
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              22.boxH(),
                              TextFormField(
                                controller: fullNameController,
                                onChanged: (value) {
                                  print(value);
                                },
                                cursorColor: Color(0xffC1120E),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/images/massage.webp',
                                      fit: BoxFit.contain,
                                      height: 22,
                                      width: 18,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  enabledBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Color(0xffC1120E), width: 1.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              14.boxH(),
                              TextFormField(
                                controller: emailController,
                                onChanged: (value) {
                                  print(value);
                                },
                                cursorColor: Color(0xffC1120E),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
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
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  enabledBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Color(0xffC1120E), width: 1.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              14.boxH(),
                              TextFormField(
                                controller: passwordController,
                                onChanged: (value) {
                                  print(value);
                                },
                                cursorColor: Color(0xffC1120E),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/images/massage.webp',
                                      fit: BoxFit.contain,
                                      height: 22,
                                      width: 18,
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  enabledBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide: BorderSide(
                                        color: Color(0xffC1120E), width: 1.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              14.boxH(),
                              TextFormField(
                                obscureText: _isObscure, //show/hide password
                                controller: confirmPasswordController,
                                onChanged: (value) {
                                  print(value);
                                },
                                cursorColor: Color(0xffC1120E),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
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
                                    borderSide: BorderSide(
                                        color: Color(0xffC1120E), width: 1.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    //<-- SEE HERE
                                    borderSide:
                                        BorderSide(color: Colors.white),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _isObscure = !_isObscure;
                                            },
                                          );
                                        },
                                        child: _isObscure
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
                              
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPressed = !isPressed;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(vertical: 45),
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
                                        spreadRadius:1,
                                        color: Colors.black.withOpacity(0.3),
                                        inset: true,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    ),
                                  ),
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account? ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.offAll(() =>Login_Screen(),transition: Transition.rightToLeftWithFade);
                                    },
                                    child: Text(
                                      " Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffC1120E),),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}