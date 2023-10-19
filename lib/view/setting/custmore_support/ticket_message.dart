import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/Widget/common_loader.dart';
import 'package:redbtc_mining_app/controllers/customer_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants/images.dart';

class TicketMessageScreen extends StatefulWidget {
  final int queryID;
  const TicketMessageScreen({super.key, required this.queryID});

  @override
  State<TicketMessageScreen> createState() => _TicketMessageScreenState();
}

class _TicketMessageScreenState extends State<TicketMessageScreen> {
  final con = Get.put(CustomerController());

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      con.scrollController.jumpTo(
        con.scrollController.position.maxScrollExtent,
      );
      con.getMessageList(widget.queryID, 0);
    });

    super.initState();
  }

  @override
  void dispose() {
    con.sendImage.value = null;
    con.messageList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 35,
              width: 35,
              // padding: const EdgeInsets.all(10),
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
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "View Ticket - ${widget.queryID.toString()}",
                style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text(
                con.selectCType.value,
                style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
              )
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 0),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffC1120E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                  con.selectStatus.value == "0"
                      ? "Open"
                      : con.selectStatus.value == "1"
                          ? "Resolve"
                          : "Close",
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            IconButton(
                onPressed: () {
                  con.getMessageList(widget.queryID, 0);
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        bottomNavigationBar: con.selectStatus.value == "0"
            ? Container(
                width: Get.width,
                // height: 60,
                decoration: const BoxDecoration(color: Color(0XFF151414)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          con.sendShowPhotoOptione();
                        },
                        child: Image.asset(
                          Images.union,
                          height: 25,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          width: Get.width,
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
                            controller: con.sendMessageTC,
                            cursorColor: const Color(0xffC1120E),
                            style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: "",
                              fillColor: Colors.black,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              hintText: "Send message...",
                              hintStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                              enabledBorder: InputBorder.none,
                              labelStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                              focusedBorder: InputBorder.none,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon: InkWell(
                                onTap: () {
                                  con.sendMessageTC.text.isEmpty ? null : con.getMessageList(widget.queryID, 1);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5, bottom: 5, left: 3, right: 3),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffC1120E),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    // size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Obx(
              () => ListView.builder(
                itemCount: con.messageList.length,
                controller: con.scrollController,
                // reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = con.messageList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: item.isAdmin == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * .7,
                          alignment: item.isAdmin == 0 ? Alignment.centerRight : Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ClipPath(
                            clipper:
                                LowerNipMessageClipper(bubbleRadius: 5, item.isAdmin == 0 ? MessageType.send : MessageType.receive, sizeOfNip: 3),
                            child: Container(
                              decoration: BoxDecoration(color: item.isAdmin == 0 ? const Color(0xffC1120E) : Color(0XFF151414)),
                              padding: EdgeInsets.only(top: 5, bottom: 8, left: item.isAdmin == 0 ? 10 : 15, right: item.isAdmin == 0 ? 10 : 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  item.photo == "" || item.photo == "null" || item.photo == null
                                      ? SizedBox()
                                      : Image.network("http://157.230.176.42/mining-app/public/images/${item.photo}",
                                          height: 200, width: 170, fit: BoxFit.cover,
                                          // loadingBuilder: (context, child, loadingProgress) {
                                          //   var progress = loadingProgress?.expectedTotalBytes != null
                                          //       ? (loadingProgress?.cumulativeBytesLoaded ?? 0) / loadingProgress!.expectedTotalBytes!
                                          //       : 1;
                                          //   print(progress);
                                          //   return progress == 1
                                          //       ? child
                                          //       : SizedBox(
                                          //           height: 200,
                                          //           width: 170,
                                          //           child: Shimmer.fromColors(
                                          //             baseColor: Colors.grey,
                                          //             highlightColor: Colors.grey.shade100,
                                          //             enabled: true,
                                          //             child: child,
                                          //           ),
                                          //         );
                                          // },
                                          loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return SizedBox(
                                              height: 200,
                                              width: 170,
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey,
                                                highlightColor: Colors.grey.shade100,
                                                enabled: true,
                                                child: child,
                                              ),
                                            );
                                          }
                                        }),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      item.message ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                    ),
                                  ),
                                  // Text(
                                  //   DateFormat.jmv().format(
                                  //     DateTime.fromMillisecondsSinceEpoch(item.createdTime!),
                                  //   ),
                                  //   style: const TextStyle(fontSize: 10),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: ClipPath(
                        //     clipper: UpperNipMessageClipperTwo(item.senderId == con.myUid ? MessageType.send : MessageType.receive),
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(color: Colors.green.shade50),
                        //       padding: EdgeInsets.only(top: 10, bottom: 10, left: item.senderId == con.myUid ? 25 : 80, right: 10),
                        //       child: Text(item.messageText ?? ""),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
