import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/view/home_page.dart';

class PurchasedNetPopup extends StatefulWidget {
  final void Function() onTap;
  const PurchasedNetPopup({super.key, required this.onTap});

  @override
  State<PurchasedNetPopup> createState() => _PurchasedNetPopupState();
}

class _PurchasedNetPopupState extends State<PurchasedNetPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60, bottom: 20),
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
                  const SizedBox(height: 40),
                  const Text("Purchased Successfully",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10),
                  const Text("Successfully Purchased Congratulation! Your purchase was successful. Contact us for any support from the setting menu.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: widget.onTap,
                          child: Container(
                            margin: EdgeInsets.only(left: 30),
                            alignment: Alignment.center,
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffC1120E)),
                              // color: Color(0xffC1120E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              "CLOSE",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                // decorationThickness: 2,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.off(() => const HomePage()),
                          child: Container(
                            margin: const EdgeInsets.only(right: 30),
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
                                // decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                // decorationThickness: 2,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                  "assets/images/purchased.png",
                  height: 50,
                ),
              )),
        ],
      ),
    );
  }
}
