import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:redbtc_mining_app/Widget/background.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';
import '../../Constants/images.dart';
import '../../Widget/common_simple_screen.dart';
import '../../inset_shodow/box_decoration.dart';
import '../../inset_shodow/box_shadow.dart';

class ContactUs_Screen extends StatefulWidget {
  const ContactUs_Screen({super.key});

  @override
  State<ContactUs_Screen> createState() => _ContactUs_ScreenState();
}

class _ContactUs_ScreenState extends State<ContactUs_Screen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'Contact Us ',
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
                  height: 200,width: 200,
                  // color: Colors.white,
                  child: Image.asset(Images.contact_us,fit: BoxFit.contain,),
                ),
                18.boxH(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  padding:EdgeInsets.symmetric(vertical: 22,horizontal: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0XFF151414),
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
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              Images.user,color: Colors.white,
                              fit: BoxFit.contain,
                              height: 22,
                              width: 18,
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color(0xffC1120E), width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color: Color(0xffC1120E), width: 1.5),
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
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "Email address",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              Images.message,color: Colors.white,
                              fit: BoxFit.contain,
                              height: 22,
                              width: 18,
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color(0xffC1120E), width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color:Color(0xffC1120E),),
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
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "Subject",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              Images.shiba,
                              fit: BoxFit.contain,
                              height: 22,
                              width: 18,
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color(0xffC1120E), width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color:Color(0xffC1120E), width: 1.5),
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
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: "Message",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              Images.message_1,
                              fit: BoxFit.contain,
                              height: 22,
                              width: 18,
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide: BorderSide(
                                color: Color(0xffC1120E), width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            //<-- SEE HERE
                            borderSide:
                                BorderSide(color:Color(0xffC1120E), width: 1.5),
                          ),
                        ),
                      ),
                      
                      25.boxH(),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding:const EdgeInsets.symmetric( vertical: 8),
                        margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
}