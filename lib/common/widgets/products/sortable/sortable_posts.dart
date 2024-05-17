import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

import '../../layouts/grid_layout.dart';
import '../post_cards/post_card_vertical.dart';

class TSortablePosts extends StatelessWidget {
  const TSortablePosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['a', 'b', 'c', 'd', 'e']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        ///Products
        TGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const PostCardVertical())
      ],
    );
  }
}