import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current index when page Scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;


  // Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // update the current index & jump to the next page
  void nextPage(){
    // if(currentPageIndex.value == 2){
    //
    //     final storage = GetStorage();
    //     storage.write('IsFirstTime', false);
    //     Get.offAll(const LoginScreen());
    // }else
    //   {
    //     int page = currentPageIndex.value + 1;
    //     pageController.jumpToPage(page);
    //   }

    final storage = GetStorage();
    if (kDebugMode){
      print(storage.read('IsFirstTime'));
    }
    storage.write('IsFirstTime', false);
    Get.offAll(() => const LoginScreen());
  }

  // Update current index and jump to the last page
  void skipPage(){
    final storage = GetStorage();
    if (kDebugMode){
      print(storage.read('IsFirstTime'));
    }
    storage.write('IsFirstTime', false);
    Get.offAll(() => const LoginScreen());

  }
}