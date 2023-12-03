import 'package:get/get.dart';
import 'package:perfecto/pages/home/bindings/home_binding.dart';
import 'package:perfecto/pages/home/home_page.dart';


class AppRoutes {
  static routes() =>[
    GetPage(name: '/', page:() => HomeScreen(),binding: HomeBinding())
  ];
}
