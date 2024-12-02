import 'package:buxx/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PaymentsListItems extends StatelessWidget {
  const PaymentsListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, index) => TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.white.withOpacity(0.4),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row1
            Row(
              children: [
                const Icon(Iconsax.money),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Apr 2024', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.md,))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            //Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.money),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment ID',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                            Text('[#289s2]', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.money),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Semester',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium,
                            ),
                            Text('6th', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),


      ),
    );
  }
}
