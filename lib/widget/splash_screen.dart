import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uberAir/constants/Constants.dart';
import 'package:uberAir/widget/home_navigator.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  SpinKitChasingDots spinkit;

  @override
  void initState() {
    super.initState();



    Future.delayed(const Duration(seconds: 6), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeNavigator()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       color:whiteColor      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         SpinKitChasingDots(
            color: primaryColor,
            size: 50.0,
            // duration: const Duration(milliseconds: 3000)
            // controller: AnimationController(
            //     vsync: this, duration: const Duration(milliseconds: 3000)),
          ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "Flight",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColorblue,
                        fontSize: Splashtext),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Booking",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: Splashtext),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
