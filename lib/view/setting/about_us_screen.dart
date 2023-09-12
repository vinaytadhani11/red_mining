import 'package:flutter/material.dart';
import 'package:redbtc_mining_app/Widget/common_simple_screen.dart';
import 'package:redbtc_mining_app/extensions/size_extensions.dart';

import '../../Constants/images.dart';
import '../../Widget/background.dart';

class AboutusScreen extends StatefulWidget {
  const AboutusScreen({super.key});

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  @override
  Widget build(BuildContext context) {
    return Mainbackground(
      child: CommonMainScreen(
        isRightIcon: false,
        title: 'About Us ',
        child: SafeArea(
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
                child: Image.asset(Images.about_us_1,fit: BoxFit.contain,),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to the BTC Mining app!',
                        style: TextStyle(
                          color: Color(0xffC1120E),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      ),
                      18.boxH(),
                      Text(
                        """Do login into our app nad click on the “start Button” fornrun the mining of points for non stop 24 hours.\n\nYou will be rewarded continuosly for 24 hours after start mining. You can mine at hourly rate of [Base Rate *(20% of base rate of active users)].\n\nYou can invite your friend and increase your hourly mining rate. They have to mine at same time you do for getting higher rate.\n\nShare the app with your friends to get highreferral bonus.\n\nEnjoy the BTC Mining!!""",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,),
                      ),
                    ],
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
