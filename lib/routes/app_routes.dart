import 'package:daviet/features/shop/screens/payments/payments.dart';
import 'package:daviet/features/shop/screens/product_review/product_reviews.dart';
import 'package:daviet/features/shop/screens/products/products.dart';
import 'package:daviet/features/shop/screens/saved/saved.dart';
import 'package:daviet/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';

class AppRoutes {
static final pages = [
GetPage(name: TRoutes.home, page: () => const HomeScreen()),
GetPage(name: TRoutes.department, page: () => const Products()),
GetPage(name: TRoutes.favourites, page: () => const SavedScreen()),
GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
GetPage(name: TRoutes.order, page: () => const PaymentsScreen()),
GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
GetPage(name: TRoutes.cart, page: () => const CartScreen()),
GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
GetPage(name: TRoutes.onBoarding, page: () => const OnboardingScreen()),
// Add more GetPage entries as needed
];}