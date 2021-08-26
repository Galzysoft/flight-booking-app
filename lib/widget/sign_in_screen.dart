import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/constants/Constants.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';
import 'package:uberAir/widget/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'forgot_password_screen.dart';

String _email;
String _password;

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                  top: 85,
                ),
                alignment: Alignment.center,
                child: Column(children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(
                      right: 50,
                      left: 50,
                      top: 140,
                    ),
                    child: Column(
                      children: <Widget>[
                        buildText2(),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "E-Mail",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (String input) {
                              _email = input;
                              return null;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String input) {
                                _password = input;
                                return null;
                              }),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                            child: Text("Forgot your password ?"),
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
                                    Fluttertoast.showToast(
                                        msg:
                                        "We send you a link to your mail adress please verify",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    context
                                        .read<AuthenticationViewModel>()
                                        .signIn(_email, _password);
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyFlightInfoField()));
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
