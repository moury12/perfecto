import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:perfecto/constants/assets_constants.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/controller/home_api_controller.dart';
import 'package:perfecto/models/product_attribute_model.dart';
import 'package:perfecto/pages/category/single_category_page.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/pages/my-cart/cart_page.dart';
import 'package:perfecto/pages/my-cart/wish_list_page.dart';
import 'package:perfecto/pages/points/my_points_page.dart';
import 'package:perfecto/pages/search/search_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

import '../../../controller/navigation_controller.dart';

class HomeTopWidget extends StatelessWidget {
  final bool isSearchInclude;
  final bool isCartPage;
  final bool isWalletPage;
  final bool isSearchpage;
  final bool isneedFilter;
  final Widget? title;

  final TextEditingController? controller;
  const HomeTopWidget(
      {super.key,
      this.controller,
      this.isSearchInclude = true,
      this.title,
      this.isSearchpage = false,
      this.isCartPage = false,
      this.isWalletPage = true,
      this.isneedFilter = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08))]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            children: [
              CustomSizedBox.space16W,
              title == null
                  ? GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        child: Image.asset(
                          AssetsConstant.drawerIcon,
                          height: 25,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomSizedBox.space8W,
              title ?? Image.asset(AssetsConstant.perfectoLogo, height: 20),
              const Spacer(),
              isWalletPage
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(MyPointsScreen.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: AppColors.kAccentColor, borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Image.asset(
                              AssetsConstant.pointsIcon,
                              height: 12,
                            ),
                            CustomSizedBox.space4W,
                            RichText(
                                text: const TextSpan(
                                    text: '',
                                    children: [TextSpan(text: '0', style: AppTheme.textStyleBoldBlack12), TextSpan(text: ' Points', style: AppTheme.textStyleNormalBlack12)])),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              CustomSizedBox.space16W,
              isCartPage
                  ? InkWell(
                      borderRadius: BorderRadius.circular(360),
                      onTap: () {
                        Get.toNamed(WishListScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16).copyWith(left: 0),
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                AssetsConstant.favIcon,
                                height: 25,
                                color: Colors.black,
                              ),
                              Positioned(
                                top: -2,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(2.5),
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.kDarkPrimaryColor),
                                  child: const Text('12', style: AppTheme.textStyleBoldWhite8),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      borderRadius: BorderRadius.circular(360),
                      onTap: () {
                        Get.toNamed(CartScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16).copyWith(left: 0),
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                AssetsConstant.cartIcon,
                                height: 25,
                              ),
                              Positioned(
                                top: 0,
                                right: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(2.5),
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.kDarkPrimaryColor),
                                  child: const Text('12', style: AppTheme.textStyleBoldWhite8),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(SearchScreen.routeName);
                },
                child: isSearchInclude
                    ? CustomTextField(
                        height: 42,
                        isEnable: isSearchpage ? true : false,
                        controller: controller ?? NavigationController.to.searchController.value,
                        hintText: 'Search for products...',
                        focusColor: AppColors.kPrimaryColor,
                        enableBorderColor: AppColors.kPrimaryColor,
                        disableBorderColor: AppColors.kPrimaryColor,
                        onSubmitted: (p0) {
                          if (p0.isNotEmpty) {
                            NavigationController.to.openSearchResult.value = true;
                            NavigationController.to.openSearchSuggestion.value = false;
                          }
                        },
                        onChanged: (value) {
                          // Get.toNamed(SearchScreen.routeName,arguments: 'searched');
                          globalLogger.d(value);
                          NavigationController.to.searchController.value.text = value;
                          NavigationController.to.isSearchFieldNotEmpty.value = value.isNotEmpty;
                        },
                        prefixWidget: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                        marginVertical: 8,
                        marginBottom: 16,
                      )
                    : const SizedBox.shrink(),
              ),
              if (isSearchpage)
                Obx(
                  () => NavigationController.to.isSearchFieldNotEmpty.value
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              NavigationController.to.openSearchSuggestion.value
                                  ? Container(
                                      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.10), blurRadius: 10)]),
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        children: [
                                          ...List.generate(
                                              4,
                                              (index) => Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.search_rounded,
                                                            color: Colors.black45,
                                                            size: 15,
                                                          ),
                                                          CustomSizedBox.space8W,
                                                          InkWell(
                                                            onTap: () {
                                                              NavigationController.to.searchController.value.text = "Lakme Absolute Lipstick";
                                                              NavigationController.to.update();
                                                            },
                                                            child: const Padding(
                                                              padding: EdgeInsets.symmetric(vertical: 8.0),
                                                              child: Text(
                                                                'Lakme Absolute Lipstick',
                                                                style: AppTheme.textStyleMediumBlack14,
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          const Icon(
                                                            Icons.arrow_forward_ios,
                                                            color: Colors.black45,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Color(0xffECECEC),
                                                      )
                                                    ],
                                                  ))
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0).copyWith(bottom: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              child: Container(
                                                padding: const EdgeInsets.all(12),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xffEEFAFF)),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset(
                                                      AssetsConstant.filter,
                                                      height: 16,
                                                    ),
                                                    CustomSizedBox.space8W,
                                                    const Text(
                                                      'FILTER',
                                                      style: AppTheme.textStyleBoldPrimary12,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                _showBottomSheetFilter(context);
                                              },
                                            ),
                                          ),
                                          CustomSizedBox.space8W,
                                          Expanded(
                                            child: GestureDetector(
                                              child: Container(
                                                padding: const EdgeInsets.all(12),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xffEEFAFF)),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset(
                                                      AssetsConstant.sort,
                                                      height: 16,
                                                    ),
                                                    CustomSizedBox.space8W,
                                                    const Text(
                                                      'SORT',
                                                      style: AppTheme.textStyleBoldPrimary12,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                _showBottomSheetSort(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              if (isneedFilter)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0).copyWith(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xffEEFAFF)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AssetsConstant.filter,
                                  height: 16,
                                ),
                                CustomSizedBox.space8W,
                                const Text(
                                  'FILTER',
                                  style: AppTheme.textStyleBoldPrimary12,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            _showBottomSheetFilter(context);
                          },
                        ),
                      ),
                      CustomSizedBox.space8W,
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: const Color(0xffEEFAFF)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  AssetsConstant.sort,
                                  height: 16,
                                ),
                                CustomSizedBox.space8W,
                                const Text(
                                  'SORT',
                                  style: AppTheme.textStyleBoldPrimary12,
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            _showBottomSheetSort(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheetSort(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: Colors.black54,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
              const Divider(
                color: Color(0xffECECEC),
                thickness: 1.5,
                height: 1.5,
              ),
              ...List.generate(
                NavigationController.to.sortList.length,
                (index) {
                  final sort = NavigationController.to.sortList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              for (var sortList in NavigationController.to.sortList) {
                                sortList.isSelected = false;
                              }
                              sort.toggleSelected();
                              NavigationController.to.update();
                              NavigationController.to.sortList.refresh();
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              margin: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sort.isSelected ? AppColors.kPrimaryColor : const Color(0xffE7E7E7),
                                  border: Border.all(width: 0.5, color: AppColors.kPrimaryColor)),
                              alignment: Alignment.center,
                              child: sort.isSelected
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              sort.name ?? '',
                              style: AppTheme.textStyleMediumCustomBlack12,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xffF3F3F3),
                        thickness: 1,
                        height: 1,
                      )
                    ],
                  );
                },
              ),
              CustomSizedBox.space16H
            ],
          );
        });
      },
    );
  }

  void _showBottomSheetFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Filter Product',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(
                              CupertinoIcons.multiply,
                              color: Colors.black54,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffECECEC),
                      thickness: 1.5,
                      height: 1.5,
                    ),
                    Obx(() {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: AppColors.klightAccentColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(NavigationController.to.attributeList.length, (index) {
                                    final filter = NavigationController.to.attributeList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        for (var attribute in NavigationController.to.attributeList) {
                                          attribute.isSelected = false;
                                        }

                                        filter.toggleSelected();

                                        NavigationController.to.update();
                                        NavigationController.to.attributeList.refresh();
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: filter.isSelected ? AppColors.kAccentColor : Colors.transparent,
                                              border: Border(right: BorderSide(color: filter.isSelected ? AppColors.kPrimaryColor : Colors.transparent, width: 2))),
                                          padding: const EdgeInsets.all(16),
                                          child: Text(
                                            filter.name ?? '',
                                            style: AppTheme.textStyleMediumCustomBlack12,
                                          )),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: FilterAttributeWidget(attributes: NavigationController.to.attributeList),
                          )
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      marginVertical: 0,
                      marginHorizontal: 0,
                      onPressed: () {
                        NavigationController.to.resetFilters();
                      },
                      primary: Colors.white,
                      borderColor: Colors.grey,
                      isBorder: true,
                      borderWidth: 1,
                      boxShadowColor: Colors.transparent,
                      elevation: 0,
                      label: 'Reset',
                      labelColor: Colors.grey,
                      width: MediaQuery.of(context).size.width / 2.25,
                    ),
                  ),
                  CustomSizedBox.space8W,
                  Expanded(
                    child: CustomButton(
                      marginVertical: 0,
                      marginHorizontal: 0,
                      onPressed: () {
                        globalLogger.d(NavigationController.to.addAttribute.toJson(), 'kkkkkkk');
                      },
                      boxShadowColor: Colors.transparent,
                      label: 'Apply',
                      width: MediaQuery.of(context).size.width / 2.25,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class FilterAttributeWidget extends StatelessWidget {
  final List<AttributeModel> attributes;
  const FilterAttributeWidget({
    super.key,
    required this.attributes,
  });

  @override
  Widget build(BuildContext context) {
    final selectedAttributes = attributes.where((attribute) => attribute.isSelected).toList();
    return Column(
      children: [
        ...List.generate(
          selectedAttributes.length,
          (index) {
            final attribute = selectedAttributes[index];

            return (attribute.name == "Category")
                ? Obx(() {
                    return Column(
                      children: [
                        ...List.generate(
                          HomeApiController.to.categoryList.length,
                          (index) {
                            final category = HomeApiController.to.categoryList[index];
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    CustomSizedBox.space16W,
                                    GestureDetector(
                                      onTap: () {
                                        category.isChecked = !category.isChecked!;
                                        HomeApiController.to.update();
                                        HomeApiController.to.categoryList.refresh();
                                        NavigationController.to.addAttribute.addAll(
                                            {'${attribute.name}': HomeApiController.to.categoryList.where((element) => element.isChecked == true).map((e) => e.id ?? '').toList()});
                                      },
                                      child: CustomCheckboxWidget(
                                        check: category.isChecked ?? false,
                                      ),
                                    ),
                                    CustomSizedBox.space12W,
                                    Expanded(
                                      child: Text(
                                        category.name ?? '',
                                        style: AppTheme.textStyleMediumCustomBlack12,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        category.isExpanded = !category.isExpanded!;

                                        HomeApiController.to.update();
                                        HomeApiController.to.categoryList.refresh();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right_sharp,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                (category.isExpanded! && category.subcategory!.isNotEmpty)
                                    ? Column(
                                        children: [
                                          ...List.generate(
                                            category.subcategory!.length,
                                            (index) => Padding(
                                              padding: const EdgeInsets.only(left: 30),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          category.subcategory![index].isChecked = !category.subcategory![index].isChecked!;
                                                          HomeApiController.to.update();
                                                          HomeApiController.to.categoryList.refresh();
                                                          NavigationController.to.addAttribute.addAll(
                                                              {'subcategory': category.subcategory!.where((element) => element.isChecked == true).map((e) => e.id ?? '').toList()});
                                                        },
                                                        child: CustomCheckboxWidget(
                                                          check: category.subcategory![index].isChecked ?? false,
                                                        ),
                                                      ),
                                                      CustomSizedBox.space12W,
                                                      Expanded(
                                                        child: Text(
                                                          category.subcategory![index].name ?? '',
                                                          style: AppTheme.textStyleMediumCustomBlack12,
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          category.subcategory![index].isExpanded = !category.subcategory![index].isExpanded!;
                                                          HomeApiController.to.update();
                                                          HomeApiController.to.categoryList.refresh();
                                                        },
                                                        child: const Padding(
                                                          padding: EdgeInsets.all(10.0),
                                                          child: Icon(
                                                            Icons.keyboard_arrow_right_sharp,
                                                            color: AppColors.kPrimaryColor,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  (category.subcategory![index].isExpanded! && category.subcategory![index].subcategory!.isNotEmpty)
                                                      ? Padding(
                                                          padding: const EdgeInsets.only(left: 16),
                                                          child: Column(
                                                            children: [
                                                              ...List.generate(category.subcategory![index].subcategory!.length, (index) {
                                                                final child = category.subcategory![index].subcategory![index];
                                                                return Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        child.isChecked = !child.isChecked!;
                                                                        HomeApiController.to.update();
                                                                        HomeApiController.to.categoryList.refresh();
                                                                        NavigationController.to.addAttribute.addAll({
                                                                          'child_category':
                                                                              category.subcategory!.where((element) => element.isChecked == true).map((e) => e.id ?? '').toList()
                                                                        });
                                                                      },
                                                                      child: CustomCheckboxWidget(check: child.isChecked!),
                                                                    ),
                                                                    CustomSizedBox.space12W,
                                                                    Expanded(
                                                                      child: Text(
                                                                        child.name ?? '',
                                                                        style: AppTheme.textStyleMediumCustomBlack12,
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        child.isExpanded = !child.isExpanded!;
                                                                        HomeApiController.to.update();
                                                                        HomeApiController.to.categoryList.refresh();
                                                                      },
                                                                      child: const Padding(
                                                                        padding: EdgeInsets.all(10.0),
                                                                        child: Icon(
                                                                          Icons.keyboard_arrow_right_sharp,
                                                                          color: AppColors.kPrimaryColor,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                );
                                                              })
                                                            ],
                                                          ),
                                                        )
                                                      : const SizedBox.shrink()
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : const SizedBox.shrink()
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  })
                : (attribute.name == "Brand")
                    ? Obx(() {
                        return Column(
                          children: [
                            ...List.generate(HomeApiController.to.brandList.length, (index) {
                              final data = HomeApiController.to.brandList[index];

                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        data.isChecked = !(data.isChecked ?? false);
                                        HomeApiController.to.update();
                                        HomeApiController.to.brandList.refresh();
                                        NavigationController.to.addAttribute.addAll(
                                            {'${attribute.name}': HomeApiController.to.brandList.where((element) => element.isChecked == true).map((e) => e.id ?? '').toList()});
                                      },
                                      child: CustomCheckboxWidget(
                                        check: data.isChecked ?? false,
                                      ),
                                    ),
                                    CustomSizedBox.space12W,
                                    Text(
                                      data.name ?? '',
                                      style: AppTheme.textStyleMediumCustomBlack12,
                                    )
                                  ],
                                ),
                              );
                            })
                          ],
                        );
                      })
                    : Column(
                        children: [
                          ...List.generate(attribute.attributes.length, (index) {
                            final data = attribute.attributes[index];

                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      data.filtered = !(data.filtered ?? false);

                                      NavigationController.to.update();
                                      NavigationController.to.attributeList.refresh();

                                      NavigationController.to.addAttribute
                                          .addAll({'${attribute.name}': attribute.attributes.where((element) => element.filtered == true).map((e) => e.id ?? '').toList()});
                                    },
                                    child: CustomCheckboxWidget(
                                      check: data.filtered ?? false,
                                    ),
                                  ),
                                  CustomSizedBox.space12W,
                                  Text(
                                    data.name ?? '',
                                    style: AppTheme.textStyleMediumCustomBlack12,
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      );
          },
        )
      ],
    );
  }
}

class CustomCheckboxWidget extends StatelessWidget {
  final bool radioButton;
  final bool check;
  const CustomCheckboxWidget({
    super.key,
    this.radioButton = false,
    this.check = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          shape: radioButton ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: radioButton ? BorderRadius.zero : BorderRadius.circular(2),
          color: check ? AppColors.kPrimaryColor : const Color(0xffE7E7E7),
          border: Border.all(width: 0.5, color: AppColors.kPrimaryColor)),
      alignment: Alignment.center,
      child: check
          ? const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 15,
            )
          : const SizedBox.shrink(),
    );
  }
}

class PrimaryAcceantListViewItemWidget extends StatelessWidget {
  final String? title;
  const PrimaryAcceantListViewItemWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEAF9FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TitleTextWidget(tileText: title ?? 'Personal Care'),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // await HomeApiController.to.productListWithCategoryCall({
                  //   'category': [category.id!].toString(),
                  // });
                  Get.toNamed(SingleCatergoryWiseScreen.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const BestSellerListWidget(
                  isBestSeller: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
