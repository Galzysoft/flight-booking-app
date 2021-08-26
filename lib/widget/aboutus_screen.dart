import 'package:flutter/material.dart';
import 'package:uberAir/constants/Constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            color:whiteColor,
         ),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              "ABOUT US",
              style: TextStyle(
                  color: primaryColor,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: whiteColor,
              margin: EdgeInsets.only(left: 20, right: 20, top: 150),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                  "\ Flight Booking application  by Eke Chinonso orji. \n With Re No of MouAu/cmp/16/93126\n these App  offers you the best prices for domestic and overseas flights and ensures  booking tickets with one-click. It is getting you various airways and kinds of options to choose best for you. In these pandemic days, there are quite fewer flights and a lot of procedure to obey. , we guide you to come through these difficult times.\n"
              ,textAlign: TextAlign.justify,),
            ),
          ),
        ]),
      ),
    );
  }
}