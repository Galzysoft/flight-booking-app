import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/constants/Constants.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';
import 'package:uberAir/widget/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
String _nameSurname;
String _email;
String _password;

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _confirmedPassword;
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                alignment: Alignment.center,
                child: Column(children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(
                      right: 50,
                      left: 50,
                      top: 75,
                    ),
                    child: Column(
                      children: <Widget>[
                        buildText2(),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name and Surname",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              if (data.length < 4) {
                                _nameSurname = data;
                                return "Please enter full name and surname";
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "E-Mail",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);

                              if (!regex.hasMatch(data)) {
                                return "unvalid email";
                              } else {
                                _email = data;
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              Pattern pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(data)) {
                                return "Password should contain upper letter\n number, special characters and at least 8 characters";
                              } else {
                                _password = data;
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              if (!(_password == data)) {
                                return "Passwords are not match";
                              } else {
                                _confirmedPassword = data;

                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:8.0.w),
                          child: Material(
                            elevation: 10.w,
                            color: Colors.transparent,
                            shadowColor: Colors.black26,
                            child:                  Padding(
                              padding: EdgeInsets.fromLTRB(16.0.w, 4.w, 16.w, 4.w),
                              child: SizedBox(
                                height: 56.h,
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  onTap: () {
                                    if (_nameSurname == null) {
                                      Fluttertoast.showToast(
                                          msg: "Please enter name and surname",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      return;
                                    } else if (_email == null) {
                                      Fluttertoast.showToast(
                                          msg: "Please enter E-Mail",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else if (_password == null) {
                                      Fluttertoast.showToast(
                                          msg: "Please enter password",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else if (_confirmedPassword == null) {
                                      Fluttertoast.showToast(
                                          msg: "Please confirm your password",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    } else {
                                      context
                                          .read<AuthenticationViewModel>()
                                          .signUp(_email, _password);
                                      Fluttertoast.showToast(
                                          msg:
                                          "We send you a link to your mail adress please verify",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      Navigator.pop(context,
                                          MaterialPageRoute(builder: (context) => MyFlightInfoField()));
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
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
                                      child:Text(
                                        "Sign up",
                                        style: TextStyle(color: Colors.white, fontSize:buttonfontsize),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Container buildText2() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flight",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:primaryColorblue,
                  fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Text(
              "Booking",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: primaryColorblue,
                  fontSize: 35),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}
