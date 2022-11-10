import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tourapplication/const/app_colors.dart';
import 'package:tourapplication/styles/styles.dart';


import '../../ui/route/route.dart';
import '../../widgets/violetbutton.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwrodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LogIn\nTo Your Account",
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.violet),
                ),

                SizedBox(
                  height: 80.h,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppStyle().textFieldDecoration("E-mail Address"),
                  controller: _emailController,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: AppStyle().textFieldDecoration("Enter Password"),
                  controller: _passwrodController,
                ),
                SizedBox(
                  height: 40.h,
                ),
                VioletButton("Login",(){},),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "---OR---",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.violet),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/google.png",
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/facebook.png")),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                    text: TextSpan(
                        text: "Don’t have registered yet? ",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                        children: [
                          TextSpan(
                            text: " SignUp",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.violet,
                          ),recognizer: TapGestureRecognizer()..onTap=()=>Get.toNamed(signup)
                          )
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
