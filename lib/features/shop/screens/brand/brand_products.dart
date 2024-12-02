import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/common/widgets/depts/dept_card.dart';
import 'package:buxx/common/widgets/products/sortable/sortable_products.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child: Column(
          children: [
            TBrandCard(showBorder: true),
            SizedBox(height:
              TSizes.spaceBtwSections,),

            TSortablePosts(products: [],),
          ],
        ),),
      ),
    );
  }
}
