import 'package:daviet/features/shop/screens/post_details/widgets/post_attributes.dart';
import 'package:daviet/features/shop/screens/post_details/widgets/post_detail_image_slider.dart';
import 'package:daviet/features/shop/screens/post_details/widgets/post_meta_data.dart';
import 'package:daviet/features/shop/screens/post_details/widgets/rating_share_widget.dart';
import 'package:daviet/utils/constants/colors.dart';

import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      backgroundColor: TColors.dark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPostImageSlider(),
            TRatingAndShare(),
            TPostMetaData(),
            TPostAttribllutes()


          ],
        ),
      ),
    );
  }
}
