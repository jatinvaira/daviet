import 'package:daviet/common/widgets/appbar/appbar.dart';
import 'package:daviet/features/shop/screens/student_review/widgets/rating_progress_indicator.dart';
import 'package:daviet/utils/constants/colors.dart';
import 'package:daviet/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StudentReviewScreen extends StatelessWidget {
  const StudentReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: TAppBar(
        title: Text('Student Reviews'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Student Reviews are are verified and are from the people who are the student or any type of connection to the institute.'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // overall reviews
              TOverallProductRating(),
              // RatingBarIndicator(
              //   itemBuilder: (_, __) => Icon(Iconsax.star, color: TColors.primary,)
              //
              // ),

            ],
          ),
        ),
      ),
    );
  }
}
