import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.

  /// Parameters:
  ///- text: The text to be displayed in the loading dialog.
  ///- animation: The Lottie animation to be shown.
  final Map<String, String> animationPaths = {
    'animation1': 'assets/images/animations/loader-animation.json',

  };
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext for overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 250), // Adjust the spacing as needed
              TAnimationLoaderWidget(text: text, animation: 'assets/images/animations/loader-animation.json'),
            ],
          ),
        ),
      ),
    );
  }




  /// stop the currently open loading dialog
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../common/widgets/loaders/animation_loader.dart';
// import '../constants/colors.dart';
// import '../helpers/helper_functions.dart';
//
// /// A utility class for managing a full-screen loading dialog.
// class TFullScreenLoader {
//   /// Open a full-screen loading dialog with a given text and animation.
//   /// This method doesn't return anything.
//
//   /// Parameters:
//   /// - text: The text to be displayed in the loading dialog.
//   /// - animation: The Lottie animation to be shown.
//   static void openLoadingDialog(String text, String animation) {
//     showDialog(
//       context: Get.overlayContext!,
//       // Use Get.overlayContext for overlay dialogs
//       barrierDismissible: false,
//       // The dialog can't be dismissed by tapping outside it
//       builder: (_) => PopScope(
//         canPop: false, // Disable popping with the back button
//         child: Container(
//           color: THelperFunctions.isDarkMode(Get.context!)
//               ? TColors.dark
//               : TColors.white,
//           width: double.infinity,
//           height: double.infinity,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TAnimationLoaderWidget(text: text, animation: animation),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Stop the currently open loading dialog
//   static void stopLoading() {
//     Navigator.of(Get.overlayContext!).pop();
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class TFullScreenLoader extends StatelessWidget {
//   final String text;
//   final String animationName;
//
//   // Map of animation names to animation paths
//   final Map<String, String> animationPaths = {
//     'animation1': 'assets/images/animations/loader-animation.json',
//
//   };
//
//   TFullScreenLoader({super.key,
//     required this.text,
//     required this.animationName,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     String? animationPath = animationPaths[animationName];
//     if (animationPath != null) {
//       return Column(
//         children: [
//           Lottie.asset(
//             animationPath,
//             height: 150,
//             width: 150,
//             fit: BoxFit.fill,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             text,
//             style: const TextStyle(fontSize: 18),
//           ),
//         ],
//       );
//     } else {
//       return const Text('Animation not found');
//     }
//   }
// }
