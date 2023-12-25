import 'package:flutter/material.dart';
import 'package:perfecto/drawer/custom_drawer.dart';
import 'package:perfecto/pages/home/widgets/home_top_widget.dart';
import 'package:perfecto/pages/home/widgets/mega_deals_widget.dart';
import 'package:perfecto/pages/home/widgets/top_brand_offer_widget.dart';
import 'package:perfecto/shared/custom_sized_box.dart';
import 'package:perfecto/theme/theme_data.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName ='/search_page';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Column(children: [
        HomeTopWidget(isSearchpage: true,),
        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TitleTextWidget(tileText: 'Trending Searches'),
            ...List.generate(5, (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Row(children: [
                Image.asset('assets/trending.png',height: 16,),
                CustomSizedBox.space8W,Text('Lakme Absolute Lipstick',style: AppTheme.textStyleNormalBlack14,)
              ],),
            )),
            CustomSizedBox.space16H,
           BestSellerListViewBuilder()
        ],))
      ],),
    );
  }
}
