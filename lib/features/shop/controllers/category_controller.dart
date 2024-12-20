import 'dart:math';

import 'package:daviet/data/repositories/categories/category_repository.dart';
import 'package:daviet/features/shop/models/category_model.dart';
import 'package:daviet/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance=> Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async{
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(c){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      // remove loader
      isLoading.value = false;
    }
  }


  /// -- Load selected category data

  /// Get Category or Sub-Category Products.


}