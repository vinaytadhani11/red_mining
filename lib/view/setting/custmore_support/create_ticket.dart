import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:full_screen_image/full_screen_image.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redbtc_mining_app/Constants/images.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/Widget/common_simple_screen.dart';
import 'package:redbtc_mining_app/controllers/customer_controller.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/inset_shodow/box_decoration.dart';
import 'package:redbtc_mining_app/inset_shodow/box_shadow.dart';
import 'package:redbtc_mining_app/view/setting/custmore_support/dot_file.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  final con = Get.put(CustomerController());

  @override
  void initState() {
    con.selectedImage.value = null;
    con.getCategoryAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Customer Support',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFF151414),
                        border: Border.all(
                          color: const Color(0xffC1120E),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create Ticket",
                            style: TextStyle(fontSize: 17, color: Color(0xffC1120E), fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(3),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                              border: Border.all(
                                color: const Color(0xffC1120E),
                              ),
                            ),
                            child: TextFormField(
                              onChanged: (value) {
                                print(value);
                              },
                              cursorColor: const Color(0xffC1120E),
                              style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                fillColor: Colors.black,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                hintText: "Enter Ticket Title",
                                hintStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                                enabledBorder: InputBorder.none,
                                labelText: "Ticket Title",
                                labelStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                focusedBorder: InputBorder.none,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                            ),
                          ),
                          Obx(
                            () => Container(
                              width: Get.width,
                              // height: 50,
                              padding: const EdgeInsets.all(3),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                border: Border.all(
                                  color: const Color(0xffC1120E),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Create Ticket",
                                      style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
                                    ),
                                    DropdownButton(
                                      isDense: true,
                                      underline: Container(),
                                      value: con.selectCategory.value,
                                      hint: Text(
                                        "Category",
                                        style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                                      ),
                                      iconSize: 40,
                                      iconEnabledColor: const Color(0xffC1120E),
                                      style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                                      isExpanded: true,
                                      dropdownColor: Color(0XFF151414),
                                      items: con.categoryList.map((element) {
                                        return DropdownMenuItem(
                                          onTap: () {
                                            con.selectCategory.value = element.name ?? "";
                                            log(con.selectCategory.value ?? "1212121");
                                          },
                                          value: element.name,
                                          enabled: true,
                                          child: Text(
                                            element.name ?? "",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        con.selectCategory.value = value.toString();
                                        print(value);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                              border: Border.all(
                                color: const Color(0xffC1120E),
                              ),
                            ),
                            child: TextFormField(
                              maxLength: 400,
                              controller: con.descriptionTC,
                              onChanged: (value) {
                                print(value);
                                con.descLength.value = con.descriptionTC.text.length.toString();
                                setState(() {});
                              },
                              cursorColor: const Color(0xffC1120E),
                              style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                              decoration: const InputDecoration(
                                counterText: "",
                                fillColor: Colors.black,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                hintText: "Enter Describe here...",
                                hintStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                                enabledBorder: InputBorder.none,
                                labelText: "Description",
                                labelStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                                focusedBorder: InputBorder.none,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${con.descLength.value}/400",
                                style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Text(
                            "Submit an attachment",
                            style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          con.selectedImage.value == null
                              ? InkWell(
                                  onTap: () {
                                    con.showPhotoOptione();
                                  },
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: const Color(0xffC1120E),
                                    radius: const Radius.circular(5),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width * .5,
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.union,
                                            height: 25,
                                          ),
                                          SizedBox(width: 10),
                                          const Text(
                                            'UPLOADD',
                                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xffC1120E)),
                                  ),
                                  child: FullScreenWidget(
                                      disposeLevel: DisposeLevel.High,
                                      backgroundIsTransparent: true,
                                      child: Image.file(con.selectedImage.value!, fit: BoxFit.fitWidth))),
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
                              'SUBMIT',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  5.boxH(),
                  const Text(
                    "Ticket List",
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  5.boxH(),
                  ticketList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ticketList() {
    return Container(
      width: Get.width,
      // height: 50,
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0XFF151414),
        border: Border.all(
          width: 1.5,
          color: const Color(0xffC1120E),
        ),
      ),
      child: Column(
        children: [
          10.boxH(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Ticket id \n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, height: 2)),
                      TextSpan(text: '958265', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Status \n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, height: 2)),
                      TextSpan(text: 'Open', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Category \n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, height: 2)),
                      TextSpan(text: 'Lorem Ipsum', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.boxH(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 15,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: const Color(0xffC1120E),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  )),
              Expanded(
                child: const MySeparator(
                  color: const Color(0xffC1120E),
                ),
              ),
              Container(
                  height: 15,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: const Color(0xffC1120E),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                  )),
            ],
          ),
          10.boxH(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Date Time \n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500, height: 2)),
                        TextSpan(text: '21/08/2023  |  12:40 PM', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Title\n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500, height: 2)),
                        TextSpan(text: 'Lorem Ipsum', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.boxH(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 15,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: const Color(0xffC1120E),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  )),
              Expanded(
                child: const MySeparator(
                  color: const Color(0xffC1120E),
                ),
              ),
              Container(
                  height: 15,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: const Color(0xffC1120E),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Description\n', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500, height: 2)),
                  TextSpan(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
