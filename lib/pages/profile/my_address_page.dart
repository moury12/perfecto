import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/pages/profile/controller/profile_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MyAddressScreen extends StatelessWidget {
  static const String routeName = '/my_addresses';
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Column(
        children: [
          HomeTopWidget(
            title: Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    AssetsConstant.backRoute,
                    height: 20,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                CustomSizedBox.space8W,
                Text(
                  'My Addresses',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space4W,
              ],
            ),
            isSearchInclude: false,
          ),
          CustomSizedBox.space12H,
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
           itemCount: 3,
           itemBuilder: (context, index) =>  Container(
             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
             decoration: BoxDecoration(
                 border:
                 Border.all(color: AppColors.kborderColor, width: .5),
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(4)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Row(
                     children: [
                       Text(
                         'Address',
                         style: AppTheme.textStyleSemiBoldBlack16,
                       ),
                       Spacer(),
                       CustomButton(
                         marginVertical: 0,
                         marginHorizontal: 0,
                         onPressed: () {},
                         primary: Colors.transparent,
                         borderColor: Colors.grey,
                         isBorder: true,
                         borderWidth: 1,
                         boxShadowColor: Colors.transparent,
                         elevation: 0,
                         prefixImage: AssetsConstant.edit,
                         prefixImageHeight: 18,
                         height: 40,
                         label: 'Edit',
                         labelColor: Colors.black,
                         width: 78,
                       ),
                       CustomSizedBox.space8W,
                       CustomButton(
                         marginVertical: 0,
                         marginHorizontal: 0,
                         onPressed: () {},
                         primary: Colors.transparent,
                         borderColor: Colors.grey,
                         isBorder: true,
                         borderWidth: 1,
                         boxShadowColor: Colors.transparent,
                         elevation: 0,
                         prefixImage: AssetsConstant.deleteIcon,
                         prefixImageHeight: 18,
                         height: 40,
                         label: '',
                         labelColor: Colors.black,
                         width: 50,
                       )
                     ],
                   ),
                 ),
                 Divider(
                   color: AppColors.kborderColor,
                   thickness: 2,
                   height: 2,
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 8),
                   child: Text(
                     'Mostafijur Rahman Sujon',
                     textAlign: TextAlign.left,
                     style: AppTheme.textStyleBoldBlack16,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 8),
                   child: Row(
                     children: [
                       Image.asset(
                         'assets/call_my.png',
                         height: 20,
                       ),
                       CustomSizedBox.space16W,
                       Text(
                         '12213245 56 ',
                         textAlign: TextAlign.left,
                         style: AppTheme.textStyleBoldBlack14,
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 8),
                   child: Row(
                     children: [
                       Image.asset(
                         AssetsConstant.email,
                         height: 20,
                       ),
                       CustomSizedBox.space16W,
                       Text(
                         'sohanahmed@gmail.com',
                         textAlign: TextAlign.left,
                         style: AppTheme.textStyleBoldBlack14,
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 8),
                   child: Row(
                     children: [
                       Image.asset(
                         AssetsConstant.locationAddress,
                         height: 20,
                       ),
                       CustomSizedBox.space16W,
                       Flexible(
                         child: Text(
                           'Dhaka, Dhaka South, 109/1/3 Link Road, North-South Mosque Goli, West Rajabazar',
                           textAlign: TextAlign.left,
                           style: AppTheme.textStyleBoldBlack14,
                         ),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 8),
                   child: Divider(
                     color: AppColors.kborderColor,
                     thickness: 1,
                     height: 1,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal: 16.0, vertical: 16),
                   child: Row(
                     children: [
                       Obx(() {
                         return GestureDetector(
                           onTap: () {
                             ProfileController.to.sameAddress.value =
                             !ProfileController.to.sameAddress.value;
                           },
                           child: Container(
                             height: 18,
                             width: 18,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(2),
                                 color:
                                 ProfileController.to.sameAddress.value
                                     ? AppColors.kPrimaryColor
                                     : Colors.white,
                                 border: Border.all(
                                     width: 0.5,
                                     color: ProfileController
                                         .to.sameAddress.value
                                         ? AppColors.kDarkPrimaryColor
                                         : Colors.black.withOpacity(.25))),
                             alignment: Alignment.center,
                             child: ProfileController.to.sameAddress.value
                                 ? Icon(
                               Icons.check_rounded,
                               color: Colors.white,
                               size: 15,
                             )
                                 : SizedBox.shrink(),
                           ),
                         );
                       }),
                       CustomSizedBox.space12W,
                       RichText(
                         text: TextSpan(
                           text: 'Set as default shipping address',
                           style: AppTheme.textStyleNormalBlack12,
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             ),
           ),
          ))
        ],
      ),
      bottomNavigationBar: CustomButton(
        label: 'Add New Address',
        marginHorizontal: 16,
        onPressed: () {},
        marginVertical: 16,
      ),
    );
  }
}
