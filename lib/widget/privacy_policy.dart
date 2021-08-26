import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberAir/constants/Constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: whiteColor,
         ),
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "PRIVACY POLICY ",textAlign: TextAlign.center,
              style: TextStyle(
                  color:primaryColor,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: whiteColor,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
                "\nWhat we do with the information we collect? The short answer is: Provide you with an amazing set of products and services that we relentlessly imrpove. Here are some of the ways we do that:\n \n - develop, operate, improve our products and services.\n \n - personalize the services, customizing the content we show you. (including ads)\n \n - monitor and analyze trends and usage. \n \n - send you communications, including by email. For example, promotional offer that we think may interest you\n"
          ,textAlign: TextAlign.justify  ),
          ),
        ]),
      ),
    );
  }
}
