import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

class CommonMainScreen extends StatelessWidget {
  final Widget? child;
  final String? title;
  final String? rightIcon;
  bool isRightIcon = false;
  void Function()? rightonTap;
  CommonMainScreen(
      {super.key,
      this.child,
      this.title,
      this.rightIcon,this.rightonTap,
      required this.isRightIcon});
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Colors.white10,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            title ?? "",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          actions: [
            isRightIcon == true
                ? InkWell(
                    onTap: rightonTap,
                    child: Container(
                      height: 28,
                      width: 28,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        // color: Colors.white10,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        rightIcon ?? "",
                        fit: BoxFit.contain,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                : SizedBox(),
            18.boxW(),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: child!,
      ),
    );
  }
}
