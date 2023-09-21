import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawSuccess extends StatefulWidget {
  final void Function() onTap;
  const WithdrawSuccess({super.key, required this.onTap});

  @override
  State<WithdrawSuccess> createState() => _WithdrawSuccessState();
}

class _WithdrawSuccessState extends State<WithdrawSuccess> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 55, bottom: 20),
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: const Color(0xffC1120E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  const Text("Withdraw Successful",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      )),
                  const SizedBox(height: 16),
                  const Text("Congratulation! withdrawal amount will be added in your account in 72 hours.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      )),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 40, bottom: 30),
                            alignment: Alignment.center,
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffC1120E)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "CLOSE",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: InkWell(
                          onTap: widget.onTap,
                          child: Container(
                            margin: const EdgeInsets.only(right: 40, bottom: 30),
                            alignment: Alignment.center,
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xffC1120E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "GO HOME",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
                "assets/images/withdraw.png",
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
