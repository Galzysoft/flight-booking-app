import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/constants/Constants.dart';
import 'package:uberAir/view_model/calendar_view_model.dart';
import 'package:uberAir/view_model/passenger_list_view_model.dart';
import 'package:uberAir/view_model/search_view_model.dart';
import 'package:uberAir/widget/flights_screen.dart';
import 'departure_calendar_screen.dart';
import 'my_app_bar_widget.dart';
import 'return_caledar_screen.dart';
import 'open_passenger_list_widget.dart';
import 'search_airports_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uberAir/widget/return_caledar_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFlightInfoField extends StatelessWidget {
  bool ydepaturee = false;
  bool yfrom = false;
  bool yto = false;
  bool yreturnn = false;

  @override
  Widget build(BuildContext context) {
    return (
        Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 8.w),
          child: Column(
            children: [
              Material(
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
                  child: _selectDate(context),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              _displayAirports(context),
              SizedBox(
                height: 8.h,
              ),
              _selectPassenger(context),
              SizedBox(
                height: 8.h,
              ),
              _searchButton(context)
            ],
          ),
        ));
  }

  Future<String> _getInboundAirport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("inboundCity");
  }

  Future<String> _getInboundCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("inboundCityName");
  }

  Future<String> _getOutboundCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("shared preferences outbound city güncellendi ");
    return prefs.getString("outboundCityName");
  }

  Future<String> _getOutboundAirport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("outboundCity");
  }

  void _setDepartureDate(String departureDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("inboundDate", departureDate);
    print("inboundDate spye eklendi");
  }

  void _setReturnDate(String returnDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("outboundDate", returnDate);
    print("outboundDate spye eklendi");
  }

  _selectDate(BuildContext context) =>
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepartureCalendar())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Departure", style: TextStyle(color: primaryColor)),
                  Consumer<CalendarViewModel>(
                      builder: (context, item, child) {
                        String departureDate =
                        item.selectedDeparuteDate.toString();
                        if (  item.selectedDeparuteDate.toString()==null) {
                          ydepaturee = false;

                        } else {

                          ydepaturee = true;
                        }

                        _setDepartureDate(departureDate);
                        return Row(
                          children: [
                            Icon(Icons.date_range_rounded,
                                color: primaryColor),
                            Text(
                              item.selectedDeparuteDate != null
                                  ? departureDate.substring(0, 10)
                                  : "Select date",
                              style: TextStyle(
                                  fontSize: subtitletext,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        );
                      }),
                  Divider(
                    thickness: 1,
                    color: primaryColor,
                  )
                ],
              ),
            ),
            Icon(Icons.flight_takeoff, color: primaryColorblue),
            InkWell(
              onTap: () =>
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ReturnCalendar())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Return", style: TextStyle(color: primaryColor)),
                  Consumer<CalendarViewModel>(
                      builder: (context, item, child) {
                        String returnDate = item.selectedReturnDate
                            .toString();
                        if (returnDate==null) {
                          yreturnn = false;

                        } else {
                          yreturnn = true;
                        }

                        _setReturnDate(returnDate);
                        return Row(
                          children: [
                            Icon(Icons.date_range_rounded,
                                color: primaryColor),
                            Text(
                              item.selectedReturnDate != null
                                  ? returnDate.substring(0, 10)
                                  : "Select date",
                              style: TextStyle(
                                  fontSize: subtitletext,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        );
                      }),
                  Divider(
                    thickness: 1,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  _displayAirports(BuildContext context) =>
      Material(
        elevation: 10.w,
        color: Colors.transparent,
        shadowColor: Colors.black26,
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0.r),
            ),
            color: Colors.white60,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("From",
                        style: TextStyle(
                            fontSize: headingtext, color: primaryColor)),
                    Expanded(
                      child: Consumer<SearchViewModel>(
                          builder: (context, item, child) {
                            return FlatButton(
                              onPressed: () {
                                // showSearch(context: context, delegate: SearchAirports());

                                item.searchNPrintResultInbound(
                                  context,
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  FutureBuilder<String>(
                                    future: _getInboundAirport(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if ( snapshot.data != null) {
                                        yfrom = true;
                                      } else {
                                        yfrom = false;
                                      }
                                      return FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          snapshot.data != null
                                              ? "${snapshot.data} "
                                              : "Select Airport",
                                          style: TextStyle(

                                              fontSize: subtitletext,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  ),
                                  FutureBuilder<String>(
                                    future: _getInboundCityName(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      return FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          snapshot.data != null
                                              ? "${snapshot.data}"
                                              : "Select Airport",
                                          style: TextStyle(
                                              fontSize: subtitletext,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                Icon(
                  Icons.flight,
                  color: primaryColor,
                ),
                Column(
                  children: [
                    Text("To",
                        style: TextStyle(
                            fontSize: headingtext, color: primaryColor)),
                    Expanded(
                      child: Consumer<SearchViewModel>(
                          builder: (context, item, child) {
                            return FlatButton(
                              onPressed: () {
                                // showSearch(context: context, delegate: SearchAirports());

                                context
                                    .read<SearchViewModel>()
                                    .searchNPrintResultOutbound(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  FutureBuilder<String>(
                                    future: _getOutboundAirport(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if ( snapshot.data != null) {
                                        yto = true;
                                      } else {
                                        yto = false;
                                      }
                                      return FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          snapshot.data != null
                                              ? "${snapshot.data} "
                                              : "Select Airport",
                                          style: TextStyle(
                                              fontSize: subtitletext,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  ),
                                  FutureBuilder<String>(
                                    future: _getOutboundCityName(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      return Container(
                                        child: Text(
                                          snapshot.data != null
                                              ? "${snapshot.data} "
                                              : "",
                                          style: TextStyle(
                                              fontSize: subtitletext,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  _selectPassenger(BuildContext context) =>
      Flexible(
        child: Material(
          elevation: 10.w,
          color: Colors.transparent,
          shadowColor: Colors.black26,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0.r),
              ),
              color: Colors.white60,
            ),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenPassengerList(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 40, color: primaryColor),
                        Text(
                          "Select Passenger",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                              fontWeight: FontWeight.w600),
                        ),

                      ],
                    ),
                    Expanded(
                      child: Consumer<ItemViewModel>(
                          builder: (context, item, child) {
                            return FutureBuilder(
                                future: item.readPassengerValue(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data != null) {
                                      return ListView.separated(
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context,
                                            int index) {
                                          String key = snapshot.data.keys
                                              .elementAt(index);
                                          return ListTile(
                                            leading: Image.asset(
                                              "assets/icons8_user_96px.png",
                                              height: 30.h,
                                              width: 30.w,
                                            ),
                                            title: Text(
                                              "${snapshot.data[key]} $key ",
                                              style: TextStyle(
                                                  fontSize: subtitletext,
                                                  fontWeight: FontWeight
                                                      .w400),
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context,
                                            int index) =>
                                            Divider(
                                              color: primaryColorblue,
                                              thickness: 1,
                                            ),
                                      );
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                });
                          }),
                    ),
                  ],
                )),
          ),
        ),
      );

  _searchButton(BuildContext context) =>
      Material(
        elevation: 10.w,
        color: Colors.transparent,
        shadowColor: Colors.black26,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0.w, 4.w, 16.w, 4.w),
          child: SizedBox(
            height: 56.h,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: InkWell(
              onTap: () {
                if ((ydepaturee == true || yreturnn == true || yfrom == true || yto == true)) {
                  print("is not empy");

                  print("ydepaturee $ydepaturee");
                  print("yreturnn $yreturnn");
                  print("yfrom $yfrom");
                  print("yto $yto");
                  Navigator.push(context,

                      MaterialPageRoute(builder: (context) => FligthScreen()));
                } else {
                  print("is  empty");
                  print("ydepaturee $ydepaturee");
                  print("yreturnn $yreturnn");
                  print("yfrom $yfrom");
                  print("yto $yto");

                  Fluttertoast.showToast(
                      msg: "some fields are not yet selected",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 40.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        gradientlight.withOpacity(0.8),
                        gradientdark.withOpacity(0.8),

                      ]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0.r),
                    topRight: Radius.circular(20.0.r),
                    bottomLeft: Radius.circular(20.0.r),
                    bottomRight: Radius.circular(20.0.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Search Avaliable flight",
                    style: TextStyle(
                        color: Colors.white, fontSize: buttonfontsize),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

}






