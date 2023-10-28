import 'package:flutter/material.dart';

class Mainbackground extends StatelessWidget {
  final Widget? child;
  const Mainbackground({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.webp',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
