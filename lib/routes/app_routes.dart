import 'package:get/get.dart';
import 'package:perfecto/bindings/auth_binding.dart';
import 'package:perfecto/pages/auth/change_password_page.dart';
import 'package:perfecto/pages/auth/forget_password_page.dart';
import 'package:perfecto/pages/auth/login_page.dart';
import 'package:perfecto/pages/auth/registration_page.dart';
import 'package:perfecto/pages/auth/return_cancelation_page.dart';
import 'package:perfecto/pages/auth/terms_condition_page.dart';
import 'package:perfecto/pages/blog/blog_details_page.dart';
import 'package:perfecto/pages/blog/blog_page.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/chat/chat_binding.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/checkout-page/checkout_bindings.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/brand_page.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/my-cart/apply_cuppon_reward.dart';
import 'package:perfecto/pages/my-cart/cart_bindings.dart';
import 'package:perfecto/pages/my-cart/cart_page.dart';
import 'package:perfecto/pages/my-cart/wish_list_page.dart';
import 'package:perfecto/pages/offer/binding/offer_binding.dart';
import 'package:perfecto/pages/offer/offer_details_page.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/offer/offer_page_v1.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/pages/outlets/outlet_details_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/product-details/combo_details_page.dart';
import 'package:perfecto/pages/product-details/product_details_binding.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/pages/product-details/product_discription_page.dart';
import 'package:perfecto/pages/product-details/product_image_preview.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/product-details/review/verified_user_page.dart';
import 'package:perfecto/pages/product-details/review/write_review_page.dart';
import 'package:perfecto/pages/profile/controller/profile_binding.dart';
import 'package:perfecto/pages/profile/edit_my_address_page.dart';
import 'package:perfecto/pages/profile/edit_password_page.dart';
import 'package:perfecto/pages/profile/edit_profile_page.dart';
import 'package:perfecto/pages/profile/my-orders/add_new_address.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_details_page.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_page.dart';
import 'package:perfecto/pages/profile/my-orders/return_page.dart';
import 'package:perfecto/pages/profile/my-orders/return_process.dart';
import 'package:perfecto/pages/profile/my_address_page.dart';
import 'package:perfecto/pages/profile/my_profile_page.dart';
import 'package:perfecto/pages/profile/my_rating_review_page.dart';
import 'package:perfecto/pages/profile/notification.dart';
import 'package:perfecto/pages/profile/profile_page.dart';
import 'package:perfecto/pages/profile/return_and_cancelation.dart';
import 'package:perfecto/pages/search/search_bindings.dart';
import 'package:perfecto/pages/search/search_page.dart';

import '../pages/category/bindings/category_binding.dart';
import '../pages/offer/sale_page.dart';

class AppRoutes {
  static routes() => [
        GetPage(
          name: MainHomeScreen.routeName,
          page: () => const MainHomeScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          // binding: HomeBinding()
        ),
        GetPage(
          name: CategoryScreen.routeName,
          page: () => const CategoryScreen(),
        ),
        GetPage(name: ProfileScreen.routeName, page: () => const ProfileScreen(), binding: ProfileBinding()),
        GetPage(name: ChatScreen.routeName, page: () => const ChatScreen(), binding: ChatBinding()),
        GetPage(name: SingleCategoryWiseScreen.routeName, page: () => const SingleCategoryWiseScreen(), binding: CategoryBinding()),
        GetPage(name: OfferScreen.routeName, page: () => const OfferScreen(), binding: OfferBinding()),
        GetPage(name: ChangePasswordScreen.routeName, page: () => const ChangePasswordScreen(), binding: AuthBinding()),
        GetPage(name: OfferScreenNew.routeName, page: () => const OfferScreenNew(), binding: OfferBinding()),
        GetPage(name: SaleScreen.routeName, page: () => const SaleScreen(), binding: OfferBinding()),
        GetPage(name: OutletScreen.routeName, page: () => const OutletScreen(), binding: OfferBinding()),
        GetPage(name: OutletDetailsScreen.routeName, page: () => const OutletDetailsScreen(), binding: OfferBinding()),
        GetPage(name: OfferDetailsScreen.routeName, page: () => const OfferDetailsScreen(), binding: OfferBinding()),
        GetPage(name: ProductDetailsScreen.routeName, page: () => const ProductDetailsScreen(), binding: ProductDetailsBinding()),
        GetPage(name: ComboDetailsScreen.routeName, page: () => const ComboDetailsScreen(), binding: ProductDetailsBinding()),
        GetPage(name: ProductShadeScreen.routeName, page: () => const ProductShadeScreen(), binding: ProductDetailsBinding()),
        GetPage(name: ProductDescriptionScreen.routeName, page: () => const ProductDescriptionScreen(), binding: ProductDetailsBinding()),
        GetPage(name: VerifiedUserScreen.routeName, page: () => const VerifiedUserScreen(), binding: ProductDetailsBinding()),
        GetPage(name: ProductImagePreview.routeName, page: () => const ProductImagePreview(), binding: ProductDetailsBinding()),
        GetPage(name: ReviewScreen.routeName, page: () => const ReviewScreen(), binding: ProductDetailsBinding()),
        GetPage(name: WriteReviewScreen.routeName, page: () => const WriteReviewScreen(), binding: ProductDetailsBinding()),
        GetPage(name: CartScreen.routeName, page: () => const CartScreen(), binding: CartBinding()),
        GetPage(name: ApplyCupponRewardScreen.routeName, page: () => const ApplyCupponRewardScreen(), binding: CartBinding()),
        GetPage(name: WishListScreen.routeName, page: () => const WishListScreen(), binding: CartBinding()),
        GetPage(name: SearchScreen.routeName, page: () => const SearchScreen(), binding: SearchBinding()),
        GetPage(name: CheckoutScreen.routeName, page: () => const CheckoutScreen(), binding: CheckoutBinding()),
        GetPage(
          name: MyProfileScreen.routeName,
          page: () => const MyProfileScreen(),
        ),
        GetPage(
          name: MyPointsScreen.routeName,
          page: () => const MyPointsScreen(),
        ),
        GetPage(
          name: MyOrdersScreen.routeName,
          page: () => const MyOrdersScreen(),
        ),
        GetPage(
          name: EditProfileScreen.routeName,
          page: () => const EditProfileScreen(),
        ),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen(), binding: AuthBinding()),
        GetPage(
          name: RegistrationScreen.routeName,
          page: () => const RegistrationScreen(),
        ),
        GetPage(
          name: ForgetPasswordScreen.routeName,
          page: () => const ForgetPasswordScreen(),
        ),
        GetPage(
          name: BrandScreen.routeName,
          page: () => const BrandScreen(),
        ),
        GetPage(
          name: TermsConditionScreen.routeName,
          page: () => const TermsConditionScreen(),
        ),
        GetPage(
          name: RefundCancelationScreen.routeName,
          page: () => const RefundCancelationScreen(),
        ),
        GetPage(
          name: BlogScreen.routeName,
          page: () => const BlogScreen(),
        ),
        GetPage(
          name: BlogDetailsScreen.routeName,
          page: () => const BlogDetailsScreen(),
        ),
        GetPage(
          name: MyAddressScreen.routeName,
          page: () => const MyAddressScreen(), /* binding: AddressBinding()*/
        ),
        GetPage(
          name: AddNewAddressScreen.routeName,
          page: () => const AddNewAddressScreen(), /* binding: ProfileBinding()*/
        ),
        GetPage(name: MyRatingReviewScreen.routeName, page: () => const MyRatingReviewScreen(), binding: ProfileBinding()),
        GetPage(name: MyOrderDetailsScreen.routeName, page: () => const MyOrderDetailsScreen(), binding: ProfileBinding()),
        GetPage(name: EditPasswordScreen.routeName, page: () => const EditPasswordScreen(), binding: ProfileBinding()),
        // GetPage(name: EditAddressScreen.routeName, page: () => const EditAddressScreen(), binding: ProfileBinding()),
        GetPage(name: ReturnScreen.routeName, page: () => const ReturnScreen(), binding: ProfileBinding()),
        GetPage(name: ReturnProcess.routeName, page: () => const ReturnProcess(), binding: ProfileBinding()),
        GetPage(name: ReturnAndCancelScreen.routeName, page: () => const ReturnAndCancelScreen(), binding: ProfileBinding()),
        GetPage(name: NotificationScreen.routeName, page: () => const NotificationScreen(), binding: ProfileBinding()),
      ];
}
