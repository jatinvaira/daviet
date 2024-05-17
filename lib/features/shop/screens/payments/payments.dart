import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/features/shop/screens/payments/widgets/payments_list.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:daviet/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark? TColors.dark: TColors.light,
      ///Appbar
      appBar: TAppBar(
        title: Text(
          'Previous payments',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),

      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: PaymentsListItems(),
      ),
    );
  }
}
