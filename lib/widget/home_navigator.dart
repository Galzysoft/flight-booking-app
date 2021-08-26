import 'package:flutter/material.dart';
import 'package:uberAir/constants/Constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uberAir/widget/privacy_policy.dart';
import 'package:uberAir/widget/upload_ticket_screen.dart';
import 'aboutus_screen.dart';
import 'home_screen.dart';
import 'my_app_bar_widget.dart';
import 'my_drawer.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(leading:  MyAppBar(), backgroundColor: whiteColor,),
      drawer: MyDrawer(),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10.h),
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/flight-booking-system-855x360.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.1,
                            0.1,
                            0.1,
                            0.6
                          ],
                          colors: [
                            gradientlight1.withOpacity(1.0),
                            gradientdark1.withOpacity(1.0),
                            gradientdark1.withOpacity(1.0),
                            gradientlight1.withOpacity(0.1),
                          ]),
                      //             color: primaryColor.withOpacity(0.3)
                    ),
                  ),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 200.h,
                    child: Column(
                      children: [

                        Expanded(
                          child: Center(
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Text(
                                          "We Fly the world",
                                          style: TextStyle(
                                              fontSize: buttonfontsize,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColorblue),
                                        )),
                                    Center(
                                        child: Text(
                                          "With Green Colors",
                                          style: TextStyle(
                                              fontSize: buttonfontsize,
                                              fontWeight: FontWeight.bold,
                                              color: whiteColor),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0.r),
                        topRight: Radius.circular(20.0.r),
                        bottomLeft: Radius.circular(0.0.r),
                        bottomRight: Radius.circular(0.0.r),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 26.0.w,
                            bottom: 8.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {showDialog(
                                    useRootNavigator: false,
                                    context: context,
                                    builder: (_) =>  Padding(
                                      padding:  EdgeInsets.only(left:30.0.w,right: 30.w,top: 100.w,bottom: 100.w),
                                      child: AboutUs(),
                                    ));},
                                splashColor: Color(0XFF639BD1),
                                child: SizedBox(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Material(
                                    elevation: 10.w,
                                    color: Colors.transparent,
                                    shadowColor: Colors.black26,
                                    child: Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0.r),
                                        ),
                                        color: Colors.white60,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 30.r,
                                                backgroundColor: whiteColor,
                                                child: Image.asset(
                                                  "assets/icons8_fighter_jet_80px.png",
                                                  width: 40.w,
                                                  height: 40.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  "About us",
                                                  style: TextStyle(
                                                      fontSize: headingtext,
                                                      fontWeight: FontWeight.bold,
                                                      color: primaryColorblue),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {showDialog(
                                    useRootNavigator: false,
                                    context: context,
                                    builder: (_) =>  Padding(
                                      padding:  EdgeInsets.only(left:30.0.w,right: 30.w,top: 100.w,bottom: 100.w),
                                      child: TicketUploadScreen(),
                                    ));},
                                splashColor: Color(0XFFFFA000),
                                child: SizedBox(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Material(
                                    elevation: 10.w,
                                    color: Colors.transparent,
                                    shadowColor: Colors.black26,
                                    child: Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0.r),
                                        ),
                                        color: Colors.white60,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 30.r,
                                                backgroundColor: whiteColor,
                                                child: Image.asset(
                                                  "assets/icons8_ticket_purchase_96px.png",
                                                  width: 40.w,
                                                  height: 40.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  "Ticket",
                                                  style: TextStyle(
                                                      fontSize: headingtext,
                                                      fontWeight: FontWeight.bold,
                                                      color: primaryColorblue),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {showDialog(
                                  useRootNavigator: false,
                                  context: context,
                                  builder: (_) =>  Padding(
                                    padding:  EdgeInsets.only(left:30.0.w,right: 30.w,top: 100.w,bottom: 100.w),
                                    child: PrivacyPolicy(),
                                  ));

                                },
                                splashColor: Color(0XFF9E91EC),
                                child: SizedBox(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Material(
                                    elevation: 10.w,
                                    color: Colors.transparent,
                                    shadowColor: Colors.black26,
                                    child: Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0.r),
                                        ),
                                        color: Colors.white60,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 30.r,
                                                backgroundColor: whiteColor,
                                                child: Image.asset(
                                                  "assets/icons8_help_96px.png",
                                                  width: 40.w,
                                                  height: 40.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  "Policies",
                                                  style: TextStyle(
                                                      fontSize: headingtext,
                                                      fontWeight: FontWeight.bold,
                                                      color: primaryColorblue),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: MyFlightInfoField()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
