import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfecto/constants/color_constants.dart';
import 'package:perfecto/pages/category/controller/category_controller.dart';
import 'package:perfecto/pages/category/widgets/single_category_product_widget.dart';
import 'package:perfecto/pages/product-details/product_details_page.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class MegaDealsWidget extends StatelessWidget {
  final String name;

  final String img;

  final int rate;
  final String price;
  final String previousPrice;
  final bool isStacked;
  final bool isBestSeller;
  final bool isBuy1Get1;
  const MegaDealsWidget({
    super.key,
    required this.name,
    required this.rate,
    required this.price,
    required this.previousPrice,
    this.isStacked = false,
    this.isBestSeller = false,
    this.isBuy1Get1 = true,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  Get.toNamed(ProductDetailsScreen.routeName);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: AppColors.kDarkPrimaryColor.withOpacity(.10), blurRadius: 8)]),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        img,
                        fit: BoxFit.fitWidth,
                        height: 109,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: AppTheme.textStyleBoldBlack12,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(color: isBuy1Get1 ? AppColors.kOfferButtonColor : AppColors.kFreeDeliveryButtonColor, borderRadius: BorderRadius.circular(2)),
                      child: Text(isBuy1Get1 ? 'Buy 1 Get 1' : 'Free Delivery', style: AppTheme.textStyleBoldWhite10)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return index == 4
                              ? const Icon(
                                  Icons.star_border_rounded,
                                  color: AppColors.kOfferButtonColor,
                                  size: 15,
                                )
                              : const Icon(
                                  Icons.star_rate_rounded,
                                  color: AppColors.kOfferButtonColor,
                                  size: 15,
                                );
                        },
                      ),
                      Text('($rate)', style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 10))
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(text: '', style: AppTheme.textStyleBoldBlack14, children: [
                  TextSpan(
                    text: '$price  ',
                    style: AppTheme.textStyleBoldBlack14,
                  ),
                  TextSpan(
                    text: previousPrice,
                    style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.normal),
                  )
                ]))
              ],
            ),
          ),
          isStacked
              ? isBestSeller
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xffD4F3FF),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: const Text(
                        'Bestseller',
                        style: TextStyle(color: Color(0xff0094CF), fontSize: 10),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xffECDDFF),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: const Text(
                        'Offer',
                        style: TextStyle(color: Color(0xff8513DF), fontSize: 10),
                      ),
                    )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  final String tileText;
  const TitleTextWidget({
    super.key,
    required this.tileText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Text(
        tileText,
        style: AppTheme.textStyleSemiBoldBlack16,
      ),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String img;
  final Widget? widget;
  final int? gridItem;
  final double? maxCrossAxisExtent;
  final List<Map<String, dynamic>> data; // Change this line
  const GridItemWidget({
    Key? key, // Fix the super.key syntax
    required this.size,
    required this.img,
    this.widget,
    this.gridItem,
    this.maxCrossAxisExtent,
    required this.data, // Change this line
  }) : super(key: key); // Fix the super.key syntax

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          SizedBox(
            height: MediaQuery.of(context).size.width > 800 ? size.height / 1.5 : size.height / 7.5,
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent ?? 150,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              Map<String, dynamic> dataItem = data[index];
              return widget ??
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width > 800 ? 8 : 0.0,
                    ),
                    child: MegaDealsWidget(
                      name: dataItem['name'],
                      isBestSeller: dataItem['isBestSeller'],
                      isBuy1Get1: dataItem['isbuy1Get1'],
                      isStacked: dataItem['isStacked'],
                      rate: dataItem['rating'],
                      price: dataItem['price'],
                      previousPrice: dataItem['previousPrice'],
                      img: dataItem['img'],
                    ),
                  );
            },
            itemCount: gridItem ?? data.length,
          ),
        ],
      ),
    );
  }
}

class GridItemForSegmentsWidget extends StatelessWidget {
  final String img;
  final Widget? widget;
  final int? gridItem;
  final double? maxCrossAxisExtent;
  final RxList<dynamic> data; // Change this line
  const GridItemForSegmentsWidget({
    Key? key, // Fix the super.key syntax
    required this.size,
    required this.img,
    this.widget,
    this.gridItem,
    this.maxCrossAxisExtent,
    required this.data, // Change this line
  }) : super(key: key); // Fix the super.key syntax

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          CustomSizedBox.space8H,
          SizedBox(
            height: MediaQuery.of(context).size.width > 800 ? size.height / 1.5 : size.height / 7.5,
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent ?? 200,
              mainAxisExtent: 370,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              Map<String, dynamic> dataItem = data[index];
              return widget ??
                  Padding(
                      padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width > 800 ? 8 : 4.0,
                      ),
                      child: SingleCategoryProductWidget(
                        name: dataItem['name'],
                        rating: dataItem['rating'],
                        img: dataItem['img'],
                        price: dataItem['price'],
                        buttonText: dataItem['buttonText'],
                        previousPrice: dataItem['previousPrice'],
                        isBestSeller: dataItem['isBestSeller'],
                        isStacked: dataItem['isStacked'],
                        isBuy1Get1: dataItem['isbuy1Get1'],
                        isDiscount: dataItem['isDiscount'],
                        isFavourite: dataItem['isFavourite'],
                        isFeatured: dataItem['isFeatured'],
                        isOnSale: dataItem['isOnSale'],
                        isOutofStock: dataItem['isOutofStock'],
                        onTap: () {
                          print(dataItem['isFavourite']);
                          dataItem['isFavourite'] = !dataItem['isFavourite'];
                          CategoryController.to.categoryWiseITem[index] = dataItem;
                        },
                      ));
            },
            itemCount: gridItem ?? data.length,
          ),
        ],
      ),
    );
  }
}
