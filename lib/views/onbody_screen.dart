import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourapplication/const/app_colors.dart';
import 'package:tourapplication/ui/route/route.dart';

import '../styles/styles.dart';

class OnBodyScreen extends StatelessWidget {
  List<String> _lottiFiles = [
    "assets/files/welcome.json",
    "assets/files/categories.json",
    "assets/files/support.json",

  ];
  List<String> _title = ["Welcome", "Categories", "Support"];
  List<String> _description = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
  ];

  RxInt _currentIndex = 0.obs;

  OnBodyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  flex: 2,
                  child: Lottie.asset(_lottiFiles[_currentIndex.toInt()]),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.scaffoldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 5,
                              spreadRadius: 1.0)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Text('${_title[_currentIndex.toInt()]}',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600)),),
                          Text("${_description[_currentIndex.toInt()]}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Obx(() =>    new DotsIndicator(
                             dotsCount: _lottiFiles.length,
                             position: _currentIndex.toDouble(),
                             decorator: DotsDecorator(
                               sizes: [
                                 const Size.square(10.0),
                                 const Size.square(15.0),
                                 const Size.square(20.0),
                               ],
                               activeSizes: [
                                 const Size.square(25.0),
                                 const Size.square(25.0),
                                 const Size.square(35.0),
                               ],
                             ),
                           ),),
                              InkWell(
                                onTap: () {
                                 if(_currentIndex==_title.length-1){
                                  Get.toNamed(signup);
                                 }else{
                                   _currentIndex+1;
                                 }
                                },
                                child: Container(
                                  height: 37.h,
                                  width: 37.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.scaffoldColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(4.0, 4.0),
                                            blurRadius: 10,
                                            spreadRadius: 1.0),
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(-4.0, -4.0),
                                            blurRadius: 5,
                                            spreadRadius: 1.0),
                                      ]),
                                  child: Icon(Icons.arrow_forward),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
