import 'package:get/get.dart';
import 'package:perfecto/pages/category/category_page.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/chat/chat_page.dart';
import 'package:perfecto/pages/home/bindings/home_binding.dart';
import 'package:perfecto/pages/home/home_page.dart';
import 'package:perfecto/pages/offer/binding/offer_binding.dart';
import 'package:perfecto/pages/offer/offer_page.dart';
import 'package:perfecto/pages/profile/profile_page.dart';

import '../pages/category/bindings/category_binding.dart';


class AppRoutes {
  static routes() =>[
    GetPage(name: '/', page:() => HomeScreen(),binding: HomeBinding()),
    GetPage(name: CategoryScreen.routeName, page:() => CategoryScreen(),),
    GetPage(name:ProfileScreen.routeName , page:() => ProfileScreen(),),
    GetPage(name: ChatScreen.routeName, page:() => ChatScreen(),),
    GetPage(name: SingleCatergoryWiseScreen.routeName, page:() => SingleCatergoryWiseScreen(),binding: CategoryBinding()),    GetPage(name: OfferScreen.routeName, page:() => OfferScreen(),binding: OfferBinding()),
  ];
}
