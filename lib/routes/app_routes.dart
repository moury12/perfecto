import 'package:get/get.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/checkout-page/checkout_bindings.dart';
import 'package:perfecto/pages/checkout-page/checkout_controller.dart';
import 'package:perfecto/pages/checkout-page/checkout_page.dart';
import 'package:perfecto/pages/home/bindings/home_binding.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/my-cart/apply_cuppon_reward.dart';
import 'package:perfecto/pages/my-cart/cart_bindings.dart';
import 'package:perfecto/pages/my-cart/cart_page.dart';
import 'package:perfecto/pages/my-cart/wish_list_page.dart';
import 'package:perfecto/pages/offer/binding/offer_binding.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/pages/outlets/outlet_details_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/product-details/product_details_binding.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/pages/product-details/product_discription_page.dart';
import 'package:perfecto/pages/product-details/product_shade_page.dart';
import 'package:perfecto/pages/product-details/review/review_page.dart';
import 'package:perfecto/pages/profile/controller/profile_binding.dart';
import 'package:perfecto/pages/profile/edit_profile_page.dart';
import 'package:perfecto/pages/profile/my-orders/my_order_page.dart';
import 'package:perfecto/pages/profile/my_address_page.dart';
import 'package:perfecto/pages/profile/my_profile_page.dart';
import 'package:perfecto/pages/profile/my_rating_review_page.dart';
import 'package:perfecto/pages/profile/profile_page.dart';
import 'package:perfecto/pages/search/search_bindings.dart';
import 'package:perfecto/pages/search/search_page.dart';

import '../pages/category/bindings/category_binding.dart';
import '../pages/offer/sale_page.dart';

class AppRoutes {
  static routes() => [
        GetPage(
            name: MainHomeScreen.routeName, page: () => const MainHomeScreen()),
        GetPage(
            name: HomeScreen.routeName,
            page: () => const HomeScreen(),
            binding: HomeBinding()),
        GetPage(
          name: CategoryScreen.routeName,
          page: () => const CategoryScreen(),
        ),
        GetPage(
          name: ProfileScreen.routeName,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: ChatScreen.routeName,
          page: () => const ChatScreen(),
        ),
        GetPage(
            name: SingleCatergoryWiseScreen.routeName,
            page: () => const SingleCatergoryWiseScreen(),
            binding: CategoryBinding()),
        GetPage(
            name: OfferScreen.routeName,
            page: () => const OfferScreen(),
            binding: OfferBinding()),
        GetPage(
            name: SaleScreen.routeName,
            page: () => const SaleScreen(),
            binding: OfferBinding()),
        GetPage(
            name: OutletScreen.routeName,
            page: () => const OutletScreen(),
            binding: OfferBinding()),
        GetPage(
            name: OutletDetailsScreen.routeName,
            page: () => const OutletDetailsScreen(),
            binding: OfferBinding()),
        GetPage(
            name: ProductDetailsScreen.routeName,
            page: () => const ProductDetailsScreen(),
            binding: ProductDetailsBinding()),
        GetPage(
            name: ProductShadeScreen.routeName,
            page: () => const ProductShadeScreen(),
            binding: ProductDetailsBinding()),
        GetPage(
            name: ProductDescriptionScreen.routeName,
            page: () => const ProductDescriptionScreen(),
            binding: ProductDetailsBinding()),
        GetPage(
            name: ReviewScreen.routeName,
            page: () => const ReviewScreen(),
            binding: ProductDetailsBinding()),
        GetPage(
            name: CartScreen.routeName,
            page: () => const CartScreen(),
            binding: CartBinding()),
        GetPage(
            name: ApplyCupponRewardScreen.routeName,
            page: () => const ApplyCupponRewardScreen(),
            binding: CartBinding()),
        GetPage(
            name: WishListScreen.routeName,
            page: () => const WishListScreen(),
            binding: CartBinding()),
        GetPage(
            name: SearchScreen.routeName,
            page: () => const SearchScreen(),
            binding: SearchBinding()),
    GetPage(
            name: CheckoutScreen.routeName,
            page: () => const CheckoutScreen(),
            binding: CheckoutBinding()),GetPage(
            name: MyProfileScreen.routeName,
            page: () => const MyProfileScreen(),
           ),GetPage(
            name: MyPointsScreen.routeName,
            page: () => const MyPointsScreen(),
           ),GetPage(
            name: MyOrdersScreen.routeName,
            page: () => const MyOrdersScreen(),
           ),GetPage(
            name: EditProfileScreen.routeName,
            page: () => const EditProfileScreen(),
           ),GetPage(
            name: MyAddressScreen.routeName,
            page: () => const MyAddressScreen(),
      binding: ProfileBinding()
           ),GetPage(
            name: MyRatingReviewScreen.routeName,
            page: () => const MyRatingReviewScreen(),
      binding: ProfileBinding()
           ),
      ];
}
