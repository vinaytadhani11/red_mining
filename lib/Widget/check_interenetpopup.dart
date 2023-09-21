import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckInterNetPopup extends StatefulWidget {
  final void Function() onTap;
  const CheckInterNetPopup({super.key, required this.onTap});

  @override
  State<CheckInterNetPopup> createState() => _CheckInterNetPopupState();
}

class _CheckInterNetPopupState extends State<CheckInterNetPopup> {
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
                  const Text("No Internet Connection",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10),
                  const Text("Your Shiba rigs are running on the cloud. For keeping it run, you must have internet connection.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xffC1120E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "TRY AGAIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
                  "assets/images/no_internat.png",
                  height: 50,
                ),
              )),
        ],
      ),
    );
  }
}
