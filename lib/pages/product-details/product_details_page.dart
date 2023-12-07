import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/network_image/network_image.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/product-details/product_details_controller.dart';
import 'package:perfecto/shared/custom_sized_box.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName ='/productDetails';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
       builder: (controller) {
          return Column(
            children: [
              // HomeTopWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: 360,
                  child: PageView.builder(

                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController!.value,
                    onPageChanged: (value) {

                      controller.currentPage.value = value;
                    },
                    itemCount: controller.bannerContent.length,
                    itemBuilder: (context, index) {
                      controller.currentPage.value = index;
                      String data = controller.bannerContent[index];
                      return CustomNetworkImage(
                        networkImagePath: '',

                        fit: BoxFit.contain,
                        errorImagePath:data,
                        height: double.maxFinite,
                        width: double.infinity,
                        borderRadius: 0,
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.bannerContent.length, (index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentPage.value == index
                          ? AppColors.kPrimaryColor
                          : AppColors.kAccentColor,
                    ),
                  );
                }),
              ),
              CustomSizedBox.space12H,
            ],
          );
        }
      ),
    );
  }
}
