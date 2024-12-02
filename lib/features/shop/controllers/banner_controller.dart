import 'dart:math';

import 'package:daviet/data/repositories/banners/banner_repository.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  ///Fetch banners
  Future<void> fetchBanners() async{
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch banners from data source (Firestore, API, etc.)
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanner();

      // Assign Banners
      this.banners.assignAll(banners);

    }catch(c){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      // remove loader
      isLoading.value = false;
    }
  }
}