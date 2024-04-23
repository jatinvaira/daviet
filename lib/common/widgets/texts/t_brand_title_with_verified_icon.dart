import 'package:daviet/common/widgets/texts/t_brand_title_text.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/enums.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = TColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSizes = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        // flexible was removed
          TBrandTitleText(
            title: title,
            textAlign: textAlign,
            color: textColor,
            maxLines: maxLines,
            brandTextSize: brandTextSizes,
          ),

        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
