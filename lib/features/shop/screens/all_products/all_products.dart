import 'package:buxx/utils/helpers/cloud_helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot, loader: loader);

              if (widget != null) return widget;

              final products = snapshot.data!;

              return TSortablePosts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
