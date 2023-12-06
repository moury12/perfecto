import 'package:get/get.dart';
import 'package:perfecto/bindings/navigation_binding.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/home/bindings/home_binding.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/offer/binding/offer_binding.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/outlets/oulet_page.dart';
import 'package:perfecto/pages/outlets/outlet_details_page.dart';
import 'package:perfecto/pages/page_with_navigation.dart';
import 'package:perfecto/pages/profile/profile_page.dart';

import '../pages/category/bindings/category_binding.dart';
import '../pages/offer/sale_page.dart';

class AppRoutes {
  static routes() => [
        GetPage(name: '/', page: () => const PageWithNavigation(), binding: NavigationBinding()),
        GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), binding: HomeBinding()),
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
            binding: OfferBinding()), GetPage(
            name: OutletDetailsScreen.routeName,
            page: () => const OutletDetailsScreen(),
            binding: OfferBinding()),
      ];
}
