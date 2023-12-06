import 'package:get/get.dart';

import '../constants/assets_constants.dart';

class NavigationController extends GetxController{
  var selectedIndex = 0.obs;
RxList<dynamic> navList=[
  {'title':'Home',
  'icon':AssetsConstant.navIcon1,
  'isSelected': false,'index':0},{'title':'Category',
  'icon':AssetsConstant.navIcon2,
  'isSelected': false,'index':1},{'title':'Chat',
  'icon':AssetsConstant.navIcon3,
  'isSelected': false,'index':2},{'title':'Account',
  'icon':AssetsConstant.navIcon4,
  'isSelected': false,'index':3},
].obs;
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}