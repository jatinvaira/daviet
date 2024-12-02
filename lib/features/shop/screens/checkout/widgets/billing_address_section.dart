import 'package:daviet/common/widgets/texts/section_heading.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: false,
          onPressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          'Jatin Vaira',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '(+123) 456 7890',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
                child: Text(
              'daviet, kabir nagar, jalandhar 144001',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            )),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
          ],
        ),
      ],
    );
  }
}
