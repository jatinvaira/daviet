import 'package:buxx/common/widgets/appbar/appbar.dart';
import 'package:buxx/features/shop/screens/payments/widgets/payments_list.dart';
import 'package:buxx/utils/constants/colors.dart';
import 'package:buxx/utils/constants/sizes.dart';
import 'package:buxx/utils/helpers/helper_functions.dart';
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
